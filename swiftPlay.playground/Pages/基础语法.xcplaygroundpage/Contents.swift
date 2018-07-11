//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello,my playground"

let myLength = 42
let myConst:Float = 4
let label = "the width is"
let width = 94
let widthLabel = label + " " + String(width)

let apples = 3
let oranges = 5
let applesSummary = "I have \(apples) apples"

/*数组*/
var shoppingList = ["catfish","water","tulips","blue paint"]
print(shoppingList[1])
shoppingList[1] = "bottle of water"
print(shoppingList[1])

/*字典*/
var ocupations = [
    "Malcolm":"Captain",
    "DaXiong":"Hero",
]
ocupations["Jone"] = "Public relations"
print(ocupations)

let emptyArr = [String]()
let emptyDic = [String:Float]()

//控制流
let individualScores = [75,43,103,87,12]

//数组
var array = ["one","two","three","four","five"]
array[1...2] = ["seven"]
print(array)

//字典
var dict = ["name":"zhangsan","age":"18","height":"170"]
for (k,v) in dict{
    print("\(k)---\(v)")
}

//嵌套函数
func calculate(opr : String)->(Int,Int)->Int{
    //定义加法函数
    func add(a:Int,b:Int)->Int{
        return a + b;
    }
    
    //定义减法函数
    func sub(a:Int,b:Int)->Int{
        return a - b;
    }
    
    //定义一个局部变量
    var result:(Int,Int)->Int
    switch (opr) {
    case "+":
        result = add
    case "-":
        result = sub
    default:
        result = add
    }
    
    return result;
}

//类的定义
class Student{
    var number:Int = 0
    var name:String = ""
    var height:Int = 0
    var weight:Int = 0
    func demo(){
        print("student")
    }
}

let stu = Student()
stu.name = "小明"
stu.demo()
print(stu.name)

//结构体的定义
struct Person
{
    var name:String = "张三"
    var age:Int = 20
}
let per = Person()
print("名字：\(per.name)")
print("年龄：\(per.age)")

//属性观察器
class PersonNew
{
    var name:String?
    var age:Int = 0
    {
        willSet
        {
        
        }
        
        didSet
        {
        
        }
    }
}



		
