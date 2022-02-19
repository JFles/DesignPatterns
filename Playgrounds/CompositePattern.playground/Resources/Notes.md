# Book Notes
- Example in the book is for PC equipment
- There's an `Equipment` abstract class(I think that's what it is?) at the top of the hierarchy
    that defines both shared methods and child management
    - Child management methods would return a failure/exception for their default implementation
        - Supports `leaf` subclasses which should **NOT** have child objects

- The `leaf` or primitive / non-composite subclasses would inherit from `Equipment` directly and override the
    shared methods only
    - i.e. `class HardDrive: Equipment`
    - **No children**

- A `Composite` subclass will be made from `Equipment` which will implement proper child object management methods
    - i.e. `class CompositeEquipment: Equipment`
- Composite objects will subclass `CompositeEquipment`
    - i.e. `class Chassis: CompositeEquipment`
    - **Supports child object management**
    - Overridden methods are implemented with child objects in mind (Iteration)


# Swift Reimplementation Notes
- To make this `Swifty`, this pattern could probably be implemented using protocols and structs instead of classes
- For the `Component` protocol, this could be limited to the shared methods
- A second protocol could be `CompositeComponent` and this can be reused for only child object management
    - Pros:
        - Only composite objects would conform to `CompositeComponent`
        - `CompositeComponent` protocol could be shared across multiple unrelated `Composite` structs across the app
        - `Leaf` would have no concept of children to manage so
            - intent is not muddied

