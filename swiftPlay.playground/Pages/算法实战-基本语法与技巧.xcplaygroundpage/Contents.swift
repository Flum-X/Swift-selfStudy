//: [Previous](@previous)

import Foundation

//交换一个数组中两个元素
func swap<T>(_ array: inout [T],_ p: Int,_ q: Int) {
    assert(p >= 0 && p < array.count)
    assert(q >= 0 && q < array.count)
    
    (array[p],array[q]) = (array[q],array[p])
}

func toZero(x: Int) -> Int {
    var x = x//不加这行会报错，原因是函数中所有参数是常量（let）
    while x > 0 {
        x -= 1
    }
    return x
}

//快速排序

