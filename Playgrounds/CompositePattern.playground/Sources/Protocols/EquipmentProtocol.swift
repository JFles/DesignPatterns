import Foundation

public protocol Equipment: Component {
    var _power: Watt { get }
    var _netPrice: Currency { get }
    var _discountPrice: Currency { get }

    func getPower() -> Watt
    func getNetPrice() -> Currency
    func getDiscountPrice() throws -> Currency
}
