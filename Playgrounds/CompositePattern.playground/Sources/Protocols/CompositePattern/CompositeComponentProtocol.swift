import Foundation

// MARK: Generic Protocol for Composite Pattern

public protocol CompositeComponent {
    // TODO: Should there be a way to change the collection structure?
    var children: [Component] { get set }
    mutating func add(child: Component)
    mutating func remove(child: Component)
}
