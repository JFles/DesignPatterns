import Foundation

public struct Currency: Equatable, Comparable {
    public var cents: Int

    public init(cents: Int) {
        self.cents = cents
    }
}

public extension Currency {
    static func < (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.cents < rhs.cents
    }

    static func ==(lhs: Currency, rhs: Currency) -> Bool {
        return lhs.cents == rhs.cents
    }
}
