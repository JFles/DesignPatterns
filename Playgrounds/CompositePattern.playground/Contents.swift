import Foundation

/// See `Resources/Notes.md` for rambling thoughts

// MARK: Test code

let hdd = HardDrive(
    name: "SuperSonic 5400RPM 486MB 2.5\" Drive",
    _power: Watt(amount: 9000),
    _netPrice: Currency(cents: 20_000),
    _discountPrice: Currency(cents: 18_000)
)

print(hdd.name)


var chassis = Chassis(
    name: "MightyBox 8000",
    children: [Component](),
    _power: Watt(amount: 0),
    _netPrice: Currency(cents: 5_000),
    _discountPrice: Currency(cents: 4_800)
)

print(chassis.name)

chassis.add(child: hdd)

print(try chassis.getDiscountPrice())
