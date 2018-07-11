//: [Previous](@previous)

import Foundation

/**属性将值跟特定的类、结构体、枚举关联
 *计算属性可以用于类、结构体、枚举
 *存储属性只能用于类和结构体
 */

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue:0, length:3)

rangeOfThreeItems.firstValue = 6

print(rangeOfThreeItems)

//延迟存储属性：第一次被访问的时候才被创建

class DataImporter {
    var fileName = "data.txt"
}

class DataManagr {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManagr()

manager.data.append("some data")

manager.data.append("some more data")

//计算属性：提供一个 getter 和一个可选的 setter,来间接获取和设置其他属性或变量的值

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x:centerX,y:centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
        
    }
    
}

//属性观察器
/**
 *父类的属性在子类的构造器中被赋值时，它在父类中的 willSet 和 didSet 观察器会被调用，随后才会调用子类的观察器。在父类初始化方法调用之前，子类给属性赋值时，观察器不会被调用。
 *
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
    
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360

//全局的常量或变量都是延迟计算的，但是不需要lazy修饰符，局部范围的常量或变量从不延迟计算

/**
 *类型属性
 *用于定义某个类型所有实例共享的数据
 *存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访 问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符
 *使用关键字 static 来定义类型属性。在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对父 类的实现进行重写。
 *类型属性是通过类型本身来访问，而不是通过实例
 */

struct SomeStructure {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 8
    }
    class var overrideableComputedTypeProperty: Int {
        return 30
    }
}

print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)









