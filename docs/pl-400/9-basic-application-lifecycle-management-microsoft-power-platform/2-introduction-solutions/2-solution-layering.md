# Solution layering

Completed

- 2 minutes

Solution layering is implemented at a component level. The following video provides an overview of the two distinct layers: managed and unmanaged solutions. These solutions exist at different layers within a Microsoft Dataverse environment.

## Managed layers

In Dataverse, managed layers have the following characteristics:

- The system layer is at the base of the managed layers level. The system layer contains the entities and components that are required for the platform to function.
- All imported, managed solutions and the system solution exist at the managed level.
- When multiple managed solutions are installed, the last one that's installed is above the managed solution that was previously installed. Essentially, the second solution that's installed can customize the one that was installed before it.
- When two managed solutions have conflicting definitions, the runtime behavior is "last one wins" or a merge logic is implemented.
- If you uninstall a managed solution, the managed solution below it will take effect.
- If you uninstall all managed solutions, the default behavior that's defined within the system solution will be applied.

## Unmanaged layer

All imported unmanaged solutions and impromptu customizations exist at the unmanaged layer. All unmanaged solutions share a single, unmanaged layer.

Certain components are available that have a merge behavior, such as site maps and forms. Each layer is merged to produce the runtime behavior as opposed to the "last layer wins" behavior.

For more information, see [Solution layers](/en-us/power-platform/alm/solution-layers-alm).
