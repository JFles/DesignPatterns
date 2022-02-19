import Foundation

// MARK: - Inheritance (Not Strategy)
class Duck {
        // MARK: - Methods
    func display() {
        print("Display Duck")
    }

    func quack() {
        print("Quack Duck")
    }

    func fly() {
        print("Fly Duck")
    }
}

class CityDuck: Duck {
    override func quack() {
        print("Quack CityDuck")
    }
}


let duck = Duck()
let cityDuck = CityDuck()

//duck.quack() // Quack Duck
//duck.display() // Display Duck
//
//cityDuck.quack() // Quack CityDuck
//cityDuck.display() // Display Duck
