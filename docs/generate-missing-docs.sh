#!/bin/bash
# generate-missing-docs.sh
#
# Generates missing SUMMARY.md, QUIZ.md, and RECALL.md files for all learn
# modules by invoking the appropriate AI agent skills.
#
# Usage:
#   ./generate-missing-docs.sh [OPTIONS]
#
# Options:
#   --dry-run                Preview what would be generated (no AI calls)
#   --skill-filter FILTER    Limit to: summary | quiz | recall | all  (default: all)
#   --ai-provider PROVIDER   AI CLI to use: copilot | opencode         (default: copilot)
#   --repo-root PATH         Repo root directory  (default: script directory)
#
# Examples:
#   ./generate-missing-docs.sh --dry-run
#   ./generate-missing-docs.sh --skill-filter recall
#   ./generate-missing-docs.sh --ai-provider opencode
#   ./generate-missing-docs.sh --ai-provider opencode --skill-filter quiz --dry-run

# -- Require bash 4+ (auto-re-exec with Homebrew bash if available) -----------
if (( BASH_VERSINFO[0] < 4 )); then
    for _candidate in /opt/homebrew/bin/bash /usr/local/bin/bash /usr/bin/bash; do
        if [[ -x "$_candidate" && "$_candidate" != "$BASH" ]]; then
            exec "$_candidate" "$0" "$@"
        fi
    done
    echo "ERROR: bash 4+ is required. Install via Homebrew: brew install bash" >&2
    exit 1
fi

set -euo pipefail

# -- ANSI colours --------------------------------------------------------------
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
RESET='\033[0m'

# -- Defaults ------------------------------------------------------------------
DRY_RUN=false
SKILL_FILTER='all'
AI_PROVIDER='copilot'
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$SCRIPT_DIR"

# -- Parse arguments -----------------------------------------------------------
while [[ $# -gt 0 ]]; do
    case "$1" in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --skill-filter)
            SKILL_FILTER="$2"
            shift 2
            ;;
        --ai-provider)
            AI_PROVIDER="$2"
            shift 2
            ;;
        --repo-root)
            REPO_ROOT="$2"
            shift 2
            ;;
        -h|--help)
            grep '^#' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//' | sed -n '/^Usage:/,/^Examples:/{ /^Examples:/d; p }'
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
    esac
done

# Validate parameters
case "$SKILL_FILTER" in
    summary|quiz|recall|all) ;;
    *) echo "ERROR: --skill-filter must be one of: summary, quiz, recall, all" >&2; exit 1 ;;
esac

case "$AI_PROVIDER" in
    copilot|opencode) ;;
    *) echo "ERROR: --ai-provider must be one of: copilot, opencode" >&2; exit 1 ;;
esac

# -- Skill definitions (bash 4+ associative arrays) ---------------------------
declare -A SKILL_FILENAME=(
    [summary]='SUMMARY.md'
    [quiz]='QUIZ.md'
    [recall]='RECALL.md'
)
declare -A SKILL_NAME=(
    [summary]='summarize-microsoft-learn'
    [quiz]='generate-quiz-from-docs'
    [recall]='create-recall-content-from-docs'
)
declare -A SKILL_PROMPT_TPL=(
    [summary]='Use the summarize-microsoft-learn skill on "%s"'
    [quiz]='Use the generate-quiz-from-docs skill on "%s"'
    [recall]='Use the create-recall-content-from-docs skill on "%s"'
)

# -- Determine active skills ---------------------------------------------------
if [[ "$SKILL_FILTER" == 'all' ]]; then
    ACTIVE_SKILLS=( summary quiz recall )
else
    ACTIVE_SKILLS=( "$SKILL_FILTER" )
fi

# -- AI provider invocation ----------------------------------------------------
invoke_ai_provider() {
    local prompt="$1"
    local provider="$2"
    case "$provider" in
        copilot)
            copilot --prompt "$prompt" --allow-all-tools --autopilot --no-ask-user --yolo
            ;;
        opencode)
            opencode run "$prompt"
            ;;
    esac
    return $?
}

# -- Helper: check if an md filename is a special/generated file ---------------
is_special_md() {
    local name="$1"
    case "$name" in
        SUMMARY.md|QUIZ.md|RECALL.md|README.md) return 0 ;;
    esac
    return 1
}

# -- Auto-discover module directories ------------------------------------------
# Finds all subdirectories (never REPO_ROOT itself) that contain at least one
# non-special .md source file, excluding .git, .agents, node_modules, and
# hidden directories.

MODULE_DIRS=()

while IFS= read -r -d '' dir; do
    # Never treat the repo root itself as a module
    [[ "$dir" == "$REPO_ROOT" ]] && continue

    source_count=0
    while IFS= read -r -d '' md_file; do
        base="$(basename "$md_file")"
        if ! is_special_md "$base"; then
            (( source_count++ )) || true
        fi
    done < <(find "$dir" -maxdepth 1 -type f -name '*.md' -print0 2>/dev/null)

    if (( source_count > 0 )); then
        MODULE_DIRS+=( "$dir" )
    fi
done < <(
    find "$REPO_ROOT" -type d \
        ! -path '*/.git' ! -path '*/.git/*' \
        ! -path '*/.agents' ! -path '*/.agents/*' \
        ! -path '*/node_modules' ! -path '*/node_modules/*' \
        ! -name '.*' \
    | sort \
    | tr '\n' '\0'
)

# Filter out ancestor directories: remove any dir that is a parent of another
# module dir. Skills must only run on leaf-level module folders to avoid
# recursively capturing the entire subtree.
LEAF_MODULE_DIRS=()
for candidate in "${MODULE_DIRS[@]}"; do
    is_ancestor=false
    for other in "${MODULE_DIRS[@]}"; do
        if [[ "$other" != "$candidate" && "$other" == "$candidate/"* ]]; then
            is_ancestor=true
            break
        fi
    done
    [[ "$is_ancestor" == false ]] && LEAF_MODULE_DIRS+=( "$candidate" )
done
MODULE_DIRS=( "${LEAF_MODULE_DIRS[@]}" )

# -- Scan for gaps -------------------------------------------------------------
# Each task stored as a pipe-delimited string:
#   relative_module|skill_key|skill_name|filename|prompt|target_path
TASKS=()

for module in "${MODULE_DIRS[@]}"; do
    for skill_key in "${ACTIVE_SKILLS[@]}"; do
        filename="${SKILL_FILENAME[$skill_key]}"
        target="$module/$filename"
        if [[ ! -f "$target" ]]; then
            # shellcheck disable=SC2059
            prompt="$(printf "${SKILL_PROMPT_TPL[$skill_key]}" "$module")"
            relative_module="${module#"$REPO_ROOT/"}"
            TASKS+=( "${relative_module}|${skill_key}|${SKILL_NAME[$skill_key]}|${filename}|${prompt}|${target}" )
        fi
    done
done

# -- Report gaps ---------------------------------------------------------------
total_modules=${#MODULE_DIRS[@]}
total_tasks=${#TASKS[@]}

echo ""
echo -e "${CYAN}================================================================${RESET}"
echo -e "${CYAN}       Generate Missing Learn Docs -- Gap Report               ${RESET}"
echo -e "${CYAN}================================================================${RESET}"
echo ""
echo "  Repo root    : $REPO_ROOT"
echo "  Modules found: $total_modules"
echo "  Skill filter : $SKILL_FILTER"
echo "  AI provider  : $AI_PROVIDER"
echo "  Gaps found   : $total_tasks"
if [[ "$DRY_RUN" == true ]]; then
    echo -e "  Mode         : ${YELLOW}DRY RUN (no changes will be made)${RESET}"
fi
echo ""

if (( total_tasks == 0 )); then
    echo -e "${GREEN}No missing files detected. All modules are up to date.${RESET}"
    exit 0
fi

for skill_key in summary quiz recall; do
    # Check if skill_key is in active skills
    active=false
    for s in "${ACTIVE_SKILLS[@]}"; do [[ "$s" == "$skill_key" ]] && active=true && break; done
    [[ "$active" == false ]] && continue

    filename="${SKILL_FILENAME[$skill_key]}"
    skill_modules=()
    for task in "${TASKS[@]}"; do
        IFS='|' read -r t_module t_skill_key _ _ _ _ <<< "$task"
        [[ "$t_skill_key" == "$skill_key" ]] && skill_modules+=( "$t_module" )
    done

    cnt=${#skill_modules[@]}
    (( cnt == 0 )) && continue

    echo -e "  ${YELLOW}Missing $filename - $cnt modules:${RESET}"
    for m in "${skill_modules[@]}"; do
        echo -e "    ${GRAY}- $m${RESET}"
    done
    echo ""
done

if [[ "$DRY_RUN" == true ]]; then
    echo -e "${YELLOW}Dry run complete. Run without --dry-run to generate the missing files.${RESET}"
    exit 0
fi

# -- Generate missing files ----------------------------------------------------
success_count=0
fail_count=0
task_index=0

for task in "${TASKS[@]}"; do
    IFS='|' read -r t_module t_skill_key t_skill_name t_filename t_prompt t_target <<< "$task"
    (( task_index++ )) || true

    echo ""
    echo -e "${DARK_GRAY}----------------------------------------------------------------${RESET}"
    echo -e "${CYAN}  [$task_index/$total_tasks] $t_filename -- $t_module${RESET}"
    echo "  Skill : $t_skill_name"
    echo "  Prompt: $t_prompt"
    echo ""

    if invoke_ai_provider "$t_prompt" "$AI_PROVIDER"; then
        echo -e "  ${GREEN}DONE -> $t_target${RESET}"
        (( success_count++ )) || true
    else
        exit_code=$?
        echo -e "  ${YELLOW}WARN: $AI_PROVIDER exited with code $exit_code${RESET}"
        (( fail_count++ )) || true
    fi
done

# -- Final summary -------------------------------------------------------------
echo ""
echo -e "${CYAN}================================================================${RESET}"
echo "  Generation complete  |  OK: $success_count  |  Failed: $fail_count  |  Total: $total_tasks"
echo -e "${CYAN}================================================================${RESET}"
echo ""
