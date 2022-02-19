import Foundation

// MARK: GoF DP - Composite Pattern - Equipment example re-implementation

public struct HardDrive: Equipment {
    public var name: String

    public var _power: Watt
    public var _netPrice: Currency
    public var _discountPrice: Currency

    public init(
        name: String,
        _power: Watt,
        _netPrice: Currency,
        _discountPrice: Currency
    ) {
        self.name = name
        self._power = _power
        self._netPrice = _netPrice
        self._discountPrice = _discountPrice
    }

    public func getPower() -> Watt {
        return _power
    }

    public func getNetPrice() -> Currency {
        return _netPrice
    }

    public func getDiscountPrice() throws -> Currency {
        guard _discountPrice < _netPrice else { throw EquipmentError.invalidPricing }
        return _discountPrice
    }
}
