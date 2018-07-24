## Description

I am an iOS developer and currently learning Swift.

First,I learned basic grammar and practice with playground.

Then I will complete some mini projects,and summarize what I learned from the project.

## Summary

### Project1

* build UI with storyboard,perform segue to transfer parameter
* more familiar with swift basic grammar，such as  
  ```optional type``` ```if let...{}``` ```guard let...else{}``` 
    
* using ```UITableViewController```directly,less code to me
* learned the access level in swift,from high to low:  
  ```open```,```public```,```internal```,```fileprivate```,```private```  
  the default is ```internal```

### Project2

* using different kinds of UI controls
* learned ```enum Optional<Wrapped>```,Cooperate with ```switch```,like:
  
  ```
  switch someOptional {
  
  	case .some(let someOptional):
  	//do something
  	
  	case .none:
  	//do something
  }
  ```
* learned how to use ```extension``` flexibly 

### Project3

* know when to use ```@objc``` in swift code:[@objc in swift - stackoverflow](https://stackoverflow.com/questions/30795117/when-to-use-objc-in-swift-code)
* learned how to handle with retain cycle in swift using ```weak```、```unowned```  
  more detail refer to [swifter.tips/retain-cycle](http://swifter.tips/retain-cycle/) 
* when you initialize a ```Timer``` with ```scheduledTimer``` method,remember to  
  add the timer to current ```RunLoop```,and use weakself like this:
    
  ```
  unowned let weakself = self  
  let timer = Timer.scheduledTimer(timeInterval: 0.5, target: weakself, selector: #someSelector, userInfo: nil, repeats: true)  
  RunLoop.current.add(timer, forMode: .commonModes)
  ```
  
### Project4

* learned how to use the global variable in swift,like ```todos: [ToDoItem]``` in this project
* Be familiar with ```UITableView``` edit mode and ```UITableViewDelegate``` methods,such as
    
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

## Resource

Refer to  [故胤道长](https://twitter.com/guyindaozhang)的[Swift-30-Projects
](https://github.com/soapyigu/Swift-30-Projects) and [Allen朝辉](https://twitter.com/creativewang)'s [30DaysSwift](https://github.com/allenwong/30DaysofSwift).
