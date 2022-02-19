import Foundation

public struct Watt: Equatable, Comparable {
    public var amount: Int

    public init(amount: Int) {
        self.amount = amount
    }
}

public extension Watt {
    static func < (lhs: Watt, rhs: Watt) -> Bool {
        return lhs.amount < rhs.amount
    }

    static func ==(lhs: Watt, rhs: Watt) -> Bool {
        return lhs.amount == rhs.amount
    }
}
