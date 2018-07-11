//: [Previous](@previous)

import Foundation

//表示并抛出错误

enum VendingMachingError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int)  //金额不足
    case outOfStock                           //缺货
}

throw VendingMachingError.insufficientFunds(coinsNeeded: 5)

//处理错误

//一个标有 throws 关键字的函数被称作 throwing 函数。如果这个函数指明了返回值类型， throws 关键词需要写在箭头( - > )的前面。
func canThrowErrors() throws -> String {
    
    return "error"
}

func cannotThrowErrors() -> String {
    return "error"
}

//只有 throwing 函数可以传递错误。任何在某个非 throwing 函数内部抛出的错误只能在函数内部处理。

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar" : Item(price: 12,count: 7),
        "Chips" : Item(price: 10,count: 4),
        "Pretzels" : Item(price: 7,count: 11),
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachingError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachingError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachingError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
    }
    
}

/**
 *由于 throw 语句会立即退出方法，所以物品只有在所有条件都满足时才会被售出
 *在 vend(itemNamed:) 方法的实现中使用了 guard 语句来提前退出方法，确保在购买某个物品所需的条件中，有任一条件不满足时，能提前退出方法并抛出相应的错误
 *
 */

let favouriteSnacks = [
    "Alice" : "Chips",
    "Bob" : "Licorice",
    "Eve" : "Pretzels"
]

func buyFavouriteSnack(person: String, vendMachine: VendingMachine) throws {
    let snackName = favouriteSnacks[person] ?? "Candy Bar"
    try vendMachine.vend(itemNamed: snackName)
}

//do-catch处理错误
var vendMac = VendingMachine()
vendMac.coinsDeposited = 8
do {
    try buyFavouriteSnack(person: "Alice", vendMachine: vendMac)
} catch VendingMachingError.invalidSelection {
    print("Invalid Selection")
}catch VendingMachingError.outOfStock {
    print("Out of Stock")
}catch VendingMachingError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}


//defer语句





