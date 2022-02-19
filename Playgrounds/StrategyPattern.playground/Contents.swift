// MARK: - Strategy Pattern
// As discussed in Chris O's Youtube video
// May differ from Go4 Strategy pattern

/*
 - To refactor this into the strategy pattern,
    - Interface needs to be implemented for each method that can have multiple concrete implementations
 - There should be no concrete implementations in the parent/base class

 - Interface would be a protocol
    - Can these be nested? One protocol or multiple protocols?

 - NOTE: This may replace the need for inheritance completely
    - Constructor Injection replaces the need to subclass
        - Object/Algorithm variance becomes at the instance level instead of at the subclass level
 */

protocol DuckType {
    var _display: DisplayType { get set }
    var _quack: QuackType { get set }
    var _fly: FlyType { get set }

    func display()
    func quack()
    func fly()
}

enum QuackType {
    case normal, city

    func quack() {
        switch self {
        case .normal:
            print("Quack - Normal")
        case .city:
            print("Quack - City")
        }
    }
}

enum DisplayType {
    case normal, city

    func display() {
        switch self {
        case .normal:
            print("Display - Normal")
        case .city:
            print("Display - City")
        }
    }
}

enum FlyType {
    case normal, city

    func fly() {
        switch self {
        case .normal:
            print("Fly - Normal")
        case .city:
            print("Fly - City")
        }
    }
}


struct Duck: DuckType {
    // MARK: - Properties
    var _display: DisplayType
    var _quack: QuackType
    var _fly: FlyType

    // MARK: - Constructor Injection
    // Inject concrete algorithms at the instance level
    init(
        displayType: DisplayType,
        quackType: QuackType,
        flyType: FlyType
    ) {
        self._display = displayType
        self._quack = quackType
        self._fly = flyType
    }

    // MARK: - Methods
    func display() {
        _display.display()
    }

    func quack() {
        _quack.quack()
    }

    func fly() {
        _fly.fly()
    }
}

let cityDuck = Duck(displayType: .city, quackType: .city, flyType: .city)
cityDuck.display()
cityDuck.quack()
cityDuck.fly()

let normalDuck = Duck(displayType: .normal, quackType: .normal, flyType: .normal)
normalDuck.display()
normalDuck.quack()
normalDuck.fly()
