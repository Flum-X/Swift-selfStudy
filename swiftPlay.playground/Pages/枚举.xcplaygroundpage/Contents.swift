//: [Previous](@previous)

import Foundation

//语法定义
enum CompassPoint {
    case north
    case south
    case east
    case west
}

/*
 与 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的
 CompassPoint 例子中，north ，south ，east 和 west 不会被隐式地赋值为 0 ，1 ，2 和 3 。
 相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的 CompassPoint 类型
 */

//多个成员值可以出现在同一行上，用逗号隔开
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//Switch 语句匹配枚举值
var directionToHead = CompassPoint.south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// MARK: - 关联值

/*
 定义一个名为 Barcode 的枚举类型，它的一个成员值是具有 (Int，Int，Int，Int) 类型关联值的 upc ，
 另一个成员值是具有 String 类型关联值的 qrCode
 */
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

/*
 关联值可以被提取出来作为 switch 语句的一部分。你可以在 switch 的 case 分支代码中提取每个关联值
 作为一个常量(用 let 前缀)或者作为一个变量(用 var 前缀)来使用:
 */
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 输出 "QR code: ABCDEFGHIJKLMNOP."

//为了简洁，上面代码也可以这么写
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// 输出 "QR code: ABCDEFGHIJKLMNOP."

// MARK: - 原始值

//定义一个使用 ASCII 码作为原始值的枚举
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

/**
 *原始值可以是字符串，字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。
 */

/*
 原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，
 它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值
 可以变化。
 */

/*原始值的隐式赋值*/

enum PlanetNew: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//在上面的例子中， PlanetNew.mercury 的显式原始值为 1 ，PlanetNew.venus 的隐式原始值为 2 ，依次类推

/*使用原始值初始化枚举实例*/

/*
 如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做 rawValue 的参数，
 参数类型即为原始值类型，返回值则是枚举成员或 nil 。你可以使用这个初始化方法来创建一个新的枚举实例。
 */

let possiblePlanet = PlanetNew(rawValue: 7)// possiblePlanet 类型为 PlanetNew? 值为 Planet.uranus


// MARK: - 递归枚举

/*
 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译
 器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归。
 */

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

