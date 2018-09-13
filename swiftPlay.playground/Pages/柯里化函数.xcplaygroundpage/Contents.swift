//: [Previous](@previous)

import Foundation

/* 什么是柯里化函数？
 柯里化（Currying），又称部分求值（Partial Evaluation），是一种函数式编程思想，就是把接受多个参数的函数转换成接收一个单一参数（最初函数的第一个参数）的函数，并且返回一个接受余下参数的新函数技术。
 
 */

// 柯里化函数定义格式
/*
func function name (parameters)(parameters) -> return type {
    statements
}
 */

/*手动实现柯里化函数*/
class Currying {
    func add(_ a: Int) -> (_ b: Int) -> (_ c: Int) -> Int {
        
        return { (b: Int) -> (_ c: Int) -> Int in
            
            return { (c: Int) -> Int in
                
                return a + b + c
            }
        }
        
    }
}

//调用
var curryInstance = Currying()
var r = curryInstance.add(2)(4)(6)

let funcB = curryInstance.add(10)

let funcC = funcB(20)

var res = funcC(30)

print("\(r),\(res)")

/*
 详细可以参考这篇文章 https://www.jianshu.com/p/6eaacadafa1a
 */


