## Description

记录自己学习Swift的过程及总结：

* 在 playground 中练习基本语法

* 完成一些小项目，并总结从项目中学到的东西

## Summary

### Project1

* storyboard构建UI,```segue```传参
* 熟悉Swift的一些基本语法，比如  
  ```optional type``` ```if let...{}``` ```guard let...else{}``` 
    
* 直接使用```UITableViewController```,更简洁方便
* 访问控制权限关键字,从高到低依次是:  
  ```open```,```public```,```internal```,```fileprivate```,```private```  
  默认权限： ```internal```

### Project2

* 熟悉常用的一些 UI 控件
* ```enum Optional<Wrapped>```,搭配```switch```使用:
  
  ```
  switch someOptional {
  
  	case .some(let someOptional):
  	//do something
  	
  	case .none:
  	//do something
  }
  ```
* 熟悉扩展```extension``` 

### Project3

* Swift中 ```@objc``` 关键字的使用:[@objc in swift - stackoverflow](https://stackoverflow.com/questions/30795117/when-to-use-objc-in-swift-code)
* 可以使用```weak```、```unowned```来避免循环引用问题，用```weak```更安全  
  参考： [swifter.tips/retain-cycle](http://swifter.tips/retain-cycle/) 
* 当你使用```scheduledTimer```方法初始化一个 ```Timer```时,记得将这个```Timer```添加到当前的```RunLoop```,同时要注意循环引用问题：
    
  ```
  unowned let weakself = self  
  let timer = Timer.scheduledTimer(timeInterval: 0.5, target: weakself, selector: #someSelector, userInfo: nil, repeats: true)  
  RunLoop.current.add(timer, forMode: .commonModes)
  ```
  
### Project4

* 全局变量的使用,项目中的 ```todos: [ToDoItem]``` 
* 熟练掌握 ```UITableView``` edit mode 以及 ```UITableViewDelegate``` 方法
    
  ```
  // Delete the cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            todos.remove(at: (indexPath as NSIndexPath).row)
            todoTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
  // Move the cell
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isEditing;
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let todo = todos.remove(at: (sourceIndexPath as NSIndexPath).row)
        todos.insert(todo, at: (destinationIndexPath as NSIndexPath).row)
    }  
  ```

Project5

* Swift闭包

```
{ (parameters) -> returnType in
     statements
}
``` 
* 使用 ```[weak self]``` 解决闭包中的循环引用问题;

```
NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
			//you should use optional value self? here
            self?.tableView.reloadData()
        }
```
* iOS8以后，可以通过添加约束（Autolayout）实现tableView cell高度自适应,详细介绍可以阅读这篇文章 [Self-Sizing Table View Cells](https://www.raywenderlich.com/1067-self-sizing-table-view-cells)

Project6

* 主要介绍```UISearchController```的使用  
  实际使用场景：  
  1.在UITableView的tableHeaderView中使用，实现类似微信首页搜索的场景  
  2.在NavigationBar的titleView上使用，实现类似淘宝首页搜索的场景
  you can also refer to [UISearchController使用指南(Swift)](https://www.jianshu.com/p/1111f279c5a9)
* Swift 属性观察器 ```willSet``` and ```didSet```

```
class MyClass {
    var date: NSDate {
        willSet {
            let d = date
            print("即将将日期从 \(d) 设定至 \(newValue)")
        }

        didSet {
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }

    init() {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.dateByAddingTimeInterval(10086)

// 输出
// 即将将日期从 2014-08-23 12:47:36 +0000 设定至 2014-08-23 15:35:42 +0000
// 已经将日期从 2014-08-23 12:47:36 +0000 设定至 2014-08-23 15:35:42 +0000
``` 
Project7  

* 学习iPad上面用的比较多的分屏视图控制器```UISplitViewController```的使用
* ```RXSwift```框架的初步学习，很好很强大，如果你理解函数式编程思想或者之前有```ReactiveCocoa```经验，应该能够很快上手。这里附上一份```RXSwift```学习文档  
   [RxSwift中文文档](https://beeth0ven.github.io/RxSwift-Chinese-Documentation/)

Project8

* 主要是一个```tableView```中点击```cell```展开、还原的动态处理
* 定义了一个```enum```记录cell状态```enum CellState {
    case expanded
    case collapsed
}```
* ```FeedParser```文件中进行网络请求(```URLSession```)及XML解析(```XMLParserDelegate```)

```
URLSession.shared.dataTask(with: feedURL, completionHandler: { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("No data fetched")
                return
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }).resume()
```

Project9

* 一个经典的展示个人信息的```tableView```页面，cell中设置图片和文字
* ```typealias```别名，相当于OC中的```typedef```  
 
examples:

```
//计算二维平面上的距离和位置的时候,用 Double 来表示距离,用 CGPoint 来表示位置  
typealias Location = CGPoint
typealias Distance = Double

func distanceBetweenPoint(point: Location, toPoint: Location) -> Double {
        let dx = Double(toPoint.x - point.x)
        let dy = Double(toPoint.y - point.y)
        return sqrt(dx*dx + dy*dy)
    }
let origin: Location = CGPoint(x: 0,y: 0)
let point: Location = CGPoint(x:1 , y: 1)
let distance: Distance = distanceBetweenPoint(origin, toPoint: point)
print(distance)//1.4142135623731
```
```
//用typealias来定义闭包
typealias sendValueClosure = (sendString: String) -> Void//声明
var callBackString: sendValueClosure?//持有
self.callBackString!(sendString: self.nameString)//调用
```
* 定义了一些```fileprivate ```文件私有方法增强代码的可读性

```
fileprivate func rows(at section: Int) -> [Any] {
        return tableViewDataSource[section][TableKeys.Rows] as! [Any]
    }
```
* ```convenience```便利构造器  

> 构造器之间的代理调用规则：  
规则 1  
指定构造器必须调用其直接父类的的指定构造器。  
规则 2  
便利构造器必须调用同类中定义的其它构造器。  
规则 3  
便利构造器最后必须调用指定构造器。  
方便记忆可以这么记：  
* 指定构造器必须总是向上代理  
* 便利构造器必须总是横向代理



## Resource

Refer to  [故胤道长](https://twitter.com/guyindaozhang)的[Swift-30-Projects
](https://github.com/soapyigu/Swift-30-Projects) and [Allen朝辉](https://twitter.com/creativewang)'s [30DaysSwift](https://github.com/allenwong/30DaysofSwift).
