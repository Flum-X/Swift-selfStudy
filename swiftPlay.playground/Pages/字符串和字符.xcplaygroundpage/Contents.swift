//: [Previous](@previous)

import Foundation

//初始化空字符串
var emptyString = ""
var anotherEmptyString = String()

//字符串是值类型
/*
 *在实际编译时，Swift编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您将字符串作为值类型的同时可以获得极高的性能（copy on write）
 */

for charater in "Hello World" {
    print(charater)
}

//连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

//可以使用append()方法将一个字符附加到一个字符串变量尾部
let exclamationMark: Character = "!"
welcome.append(exclamationMark)

//字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is (Double(multiplier) * 2.5)"

//计算字符数量
let someStr = "some string"
print(someStr.count)

//字符串索引
/*
 *每一个 String值都有一个关联的索引(index)类型，String.Index，它对应着字符串中的每一个 Character的位置
 */

/*不同的字符可能会占用不同数量的内存空间
 *所以要知道Charater的确定位置，就必须从String开头遍历每一个Unicode标量直到结尾
 *因此，Swift 的字符串不能用整数(integer)做索引
 */
let greeting = "Guten Tag"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]

greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//插入和删除
var welcome1 = "Hello"
welcome1.insert("!", at: welcome1.endIndex)

welcome1.insert(contentsOf: " there", at: welcome1.index(before: welcome1.endIndex))

welcome1.remove(at: welcome.index(before: welcome1.endIndex))
let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex
welcome1.removeSubrange(range)


