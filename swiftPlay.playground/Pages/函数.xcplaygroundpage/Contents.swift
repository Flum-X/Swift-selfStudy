//: [Previous](@previous)

import Foundation

//无返回值函数
func greet(person: String) {
    print ("Hello,\(person) ")
}
greet(person: "DaXiong")

/*
 *严格上来说，虽然没有返回值被定义，greet(person:) 函数依然返回了值。没有定义返回类型的函数会返回一 个特殊的 Void 值。它其实是一个空的元组(tuple)，没有任何元素，可以写成()。
 */

//被调用时，一个函数的返回值可以被忽略
func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

let count = printAndCount(string: "hello word")
printWithoutCounting(string: "hello word")

//忽略参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2)
/**
 *如果一个参数有一个标签，那么在调用的时候必须使用标签来标记这个参数。
 */

/*
 *默认参数值
 */
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
//当默认值被定义后，调用这 个函数时可以忽略这个参数
someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12

/*
 *可变参数
 */
//一个可变参数(variadic parameter)可以接受零个或多个值
//函数调用时，你可以用可变参数来指定函数参数 可以被传入不确定数量的输入值。通过在变量类型名后面加入( ... )的方式来定义可变参数。
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// 返回 3.0, 是这 5 个数的平均数。
arithmeticMean(3, 8.25, 18.75)
// 返回 10.0, 是这 3 个数的平均数。


/*
 *输入输出参数
 */
//注意: 输入输出参数不能有默认值，而且可变参数不能用 inout 标记
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 50
var anotherInt = 100
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//交换一个数组中的两个值
func swap(chars: inout [Character], _ p: Int, _ q: Int) {
    let temp = chars[p]
    chars[p] = chars[q]
    chars[q] = temp
}

var array = [Character]("abcdefg12345".characters)
swap(chars: &array, 0, 1)

//更进一步，使用泛型和元组编程
func swap<T>(_ array: inout [T],_ p: Int,_ q: Int) {
    assert(p >= 0 && p < array.count)
    assert(q >= 0 && q < array.count)
    
    (array[p],array[q]) = (array[q],array[p])
}

