import Foundation

// MARK: GoF DP - Composite Pattern - Equipment example re-implementation

public struct Chassis: Equipment, CompositeComponent {
    public var name: String
    public var children: [Component]

    public var _power: Watt
    public var _netPrice: Currency
    public var _discountPrice: Currency

    public init(
        name: String,
        children: [Component],
        _power: Watt,
        _netPrice: Currency,
        _discountPrice: Currency
    ) {
        self.name = name
        self.children = children
        self._power = _power
        self._netPrice = _netPrice
        self._discountPrice = _discountPrice
    }

    public func getPower() -> Watt {
        var netPower = Watt(amount: 0)
        for case let child as Equipment in children {
            netPower.amount += child.getPower().amount
        }
        return netPower
    }

    public func getNetPrice() -> Currency {
        var netPrice = Currency(cents: 0)
        for case let child as Equipment in children {
            netPrice.cents += child.getNetPrice().cents
        }
        return netPrice
    }

    public func getDiscountPrice() throws -> Currency {
        var netDiscountedPrice = Currency(cents: 0)
        for case let child as Equipment in children {
            if let childDiscountPrice = try? child.getDiscountPrice().cents {
                netDiscountedPrice.cents += childDiscountPrice
            }
        }

        guard netDiscountedPrice < getNetPrice() else { throw EquipmentError.invalidPricing }

        return netDiscountedPrice
    }

    mutating public func add(child: Component) {
        children.append(child)
    }

    mutating public func remove(child: Component) {
            // TODO: Figure out how to write this with maps
        if let index = children.firstIndex(where: { $0.name == child.name } ) {
            children.remove(at: index)
        }
    }
}
