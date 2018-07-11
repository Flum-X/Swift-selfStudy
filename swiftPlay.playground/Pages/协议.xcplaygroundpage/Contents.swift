//: [Previous](@previous)

import Foundation

protocol FirstProtocol {
    // 这里是协议的定义部分
}

protocol AnotherProtocol {
    // 这里是协议的定义部分
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
    // 这里是结构体的定义部分
}

class Person {
    
}

class SomeClass:Person, FirstProtocol, AnotherProtocol {
    // 这里是类的定义部分
}

/*属性要求
 *协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性
 *协议不指定属性是存储型属性还是计算型属性，它只指定属性的名称和类型
 *如果协议只要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的
 */
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

/*定义类型属性
 *在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型遵循协议 时，除了 static 关键字，还可以使用 class 关键字作为前缀
 */
protocol classTypePro {
    static var someTypeProperty: Int {get set}
}

//Mutating 方法要求

/*有时需要在方法中改变方法所属的实例
 *例如，在值类型(即结构体和枚举)的实例方法中
 *将 mutating 关键字作为方法的前缀，写在 func 关键字之前
 *表示可以在该方法中修改它所属的实例以及实例的任意属性的值
 */

/*如果你在协议中定义了一个实例方法，该方法会改变遵循该协议的类型的实例，那么在定义协议时需要在方法前 加 mutating 关键字。这使得结构体和枚举能够遵循此协议并满足此方法要求。
 *
 */

/**
 *实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写
 mutating 关键字。
 */

protocol toggle {
    mutating func toggle()
}

enum OnOffSwitch: toggle{
    case Off,On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

//构造器要求
protocol SomeProtocol1 {
    init(someParameter: Int)
}

//构造器要求在类中的实现
class SomeClass1: SomeProtocol1 {
    required init(someParameter: Int) {
        //使用 required 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议
        //如果类已经被标记为 final ，那么不需要在协议构造器的实现中使用 required 修饰符，因为 final 类不 能有子类
    }
}

protocol SomeProtocol2 {
    init()
}

class SomeSuperClass {
    init() {
        
    }
}

class SomeSubClass: SomeSuperClass,SomeProtocol2 {
    // 因为遵循协议，需要加上 required
    // 因为继承自父类，需要加上 override
    required override init() {
        
    }
}

//协议作为类型
/*
 *协议是一种类型，因此协议类型的名称应与其他类型(例如 Int ， Double ， String )的写法相同，使用大写 字母开头的驼峰式写法
 */
