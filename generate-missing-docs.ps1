<#
.SYNOPSIS
    Generates missing SUMMARY.md, QUIZ.md, and RECALL.md files for all learn modules
    by invoking the appropriate AI agent skills.

.DESCRIPTION
    Scans all module directories under the repo root, detects which study files are
    missing, and calls the selected AI provider CLI with the correct skill prompt.
    Module directories are auto-discovered from the repo root -- no hardcoded paths.

.PARAMETER DryRun
    Preview what would be generated without actually invoking any AI provider.

.PARAMETER SkillFilter
    Limit generation to one file type: 'summary', 'quiz', or 'recall'.
    Defaults to all three.

.PARAMETER AIProvider
    The AI CLI to use for generation. 'copilot' uses the GitHub Copilot CLI;
    'opencode' uses the OpenCode CLI. Defaults to 'copilot'.

.PARAMETER RepoRoot
    Path to the repository root. Defaults to the directory this script lives in.

.EXAMPLE
    .\generate-missing-docs.ps1 -DryRun

.EXAMPLE
    .\generate-missing-docs.ps1 -SkillFilter recall

.EXAMPLE
    .\generate-missing-docs.ps1 -AIProvider opencode

.EXAMPLE
    .\generate-missing-docs.ps1 -AIProvider opencode -SkillFilter quiz -DryRun
#>

[CmdletBinding()]
param(
    [switch]$DryRun,

    [ValidateSet('summary', 'quiz', 'recall', 'all')]
    [string]$SkillFilter = 'all',

    [ValidateSet('copilot', 'opencode')]
    [string]$AIProvider = 'copilot',

    [string]$RepoRoot = $PSScriptRoot
)

# -- Skill definitions --------------------------------------------------------

$skills = @{
    summary = @{
        FileName  = 'SUMMARY.md'
        SkillName = 'summarize-microsoft-learn'
        PromptTpl = 'Use the summarize-microsoft-learn skill on "{0}"'
    }
    quiz = @{
        FileName  = 'QUIZ.md'
        SkillName = 'generate-quiz-from-docs'
        PromptTpl = 'Use the generate-quiz-from-docs skill on "{0}"'
    }
    recall = @{
        FileName  = 'RECALL.md'
        SkillName = 'create-recall-content-from-docs'
        PromptTpl = 'Use the create-recall-content-from-docs skill on "{0}"'
    }
}

# -- Determine which skills to run --------------------------------------------

$activeSkills = if ($SkillFilter -eq 'all') { $skills.Keys } else { @($SkillFilter) }

# -- Build AI provider invocation ---------------------------------------------

function Invoke-AIProvider {
    param([string]$Prompt, [string]$Provider)
    switch ($Provider) {
        'copilot'  { & copilot --prompt $Prompt --allow-all-tools --autopilot --no-ask-user --yolo }
        'opencode' { & opencode run $Prompt }
    }
    return $LASTEXITCODE
}

# -- Auto-discover module directories -----------------------------------------
# Scans all non-hidden top-level dirs for subdirectories containing source .md files.

$excludedDirs = @('.git', '.agents', '.vscode', 'node_modules')

$moduleDirs = @()
foreach ($topDir in (Get-ChildItem -Path $RepoRoot -Directory | Where-Object { $_.Name -notin $excludedDirs -and $_.Name -notlike '.*' })) {
    foreach ($sub in (Get-ChildItem -Path $topDir.FullName -Directory -ErrorAction SilentlyContinue)) {
        $sourceCount = (Get-ChildItem -Path $sub.FullName -Filter '*.md' -ErrorAction SilentlyContinue |
            Where-Object { $_.Name -notin @('SUMMARY.md', 'QUIZ.md', 'RECALL.md', 'README.md') }).Count
        if ($sourceCount -gt 0) { $moduleDirs += $sub }
    }
}

# -- Scan for gaps ------------------------------------------------------------

$tasks = [System.Collections.Generic.List[hashtable]]::new()

foreach ($module in $moduleDirs) {
    foreach ($skillKey in $activeSkills) {
        $skill  = $skills[$skillKey]
        $target = Join-Path $module.FullName $skill.FileName
        if (-not (Test-Path $target)) {
            $tasks.Add(@{
                Module     = $module.FullName.Replace($RepoRoot + '\', '')
                SkillKey   = $skillKey
                SkillName  = $skill.SkillName
                FileName   = $skill.FileName
                Prompt     = ($skill.PromptTpl -f $module.FullName)
                TargetPath = $target
            })
        }
    }
}

# -- Report gaps --------------------------------------------------------------

$totalModules = $moduleDirs.Count
$totalTasks   = $tasks.Count

Write-Host ''
Write-Host '================================================================' -ForegroundColor Cyan
Write-Host '       Generate Missing Learn Docs -- Gap Report               ' -ForegroundColor Cyan
Write-Host '================================================================' -ForegroundColor Cyan
Write-Host ''
Write-Host "  Repo root    : $RepoRoot"
Write-Host "  Modules found: $totalModules"
Write-Host "  Skill filter : $SkillFilter"
Write-Host "  AI provider  : $AIProvider"
Write-Host "  Gaps found   : $totalTasks"
if ($DryRun) { Write-Host '  Mode         : DRY RUN (no changes will be made)' -ForegroundColor Yellow }
Write-Host ''

if ($totalTasks -eq 0) {
    Write-Host 'No missing files detected. All modules are up to date.' -ForegroundColor Green
    exit 0
}

foreach ($skillKey in @('summary', 'quiz', 'recall')) {
    if ($skillKey -notin $activeSkills) { continue }
    $skillTasks = @($tasks | Where-Object { $_.SkillKey -eq $skillKey })
    if ($skillTasks.Count -eq 0) { continue }
    $cnt      = $skillTasks.Count
    $fileName = $skills[$skillKey].FileName
    Write-Host "  Missing $fileName - $cnt modules:" -ForegroundColor Yellow
    foreach ($t in $skillTasks) { Write-Host "    - $($t.Module)" -ForegroundColor Gray }
    Write-Host ''
}

if ($DryRun) {
    Write-Host 'Dry run complete. Run without -DryRun to generate the missing files.' -ForegroundColor Yellow
    exit 0
}

# -- Generate missing files ---------------------------------------------------

$successCount = 0
$failCount    = 0
$taskIndex    = 0

foreach ($task in $tasks) {
    $taskIndex++
    Write-Host ''
    Write-Host '----------------------------------------------------------------' -ForegroundColor DarkGray
    Write-Host "  [$taskIndex/$totalTasks] $($task.FileName) -- $($task.Module)" -ForegroundColor Cyan
    Write-Host "  Skill : $($task.SkillName)"
    Write-Host "  Prompt: $($task.Prompt)"
    Write-Host ''

    try {
        $exitCode = Invoke-AIProvider -Prompt $task.Prompt -Provider $AIProvider
        if ($exitCode -eq 0) {
            Write-Host "  DONE -> $($task.TargetPath)" -ForegroundColor Green
            $successCount++
        } else {
            Write-Host "  WARN: $AIProvider exited with code $exitCode" -ForegroundColor Yellow
            $failCount++
        }
    } catch {
        Write-Host "  FAIL: Error invoking ${AIProvider}: $_" -ForegroundColor Red
        $failCount++
    }
}

# -- Final summary ------------------------------------------------------------

Write-Host ''
Write-Host '================================================================' -ForegroundColor Cyan
Write-Host "  Generation complete  |  OK: $successCount  |  Failed: $failCount  |  Total: $totalTasks"
Write-Host '================================================================' -ForegroundColor Cyan
Write-Host ''