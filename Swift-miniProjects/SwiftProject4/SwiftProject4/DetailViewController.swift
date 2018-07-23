//
//  DetailViewController.swift
//  SwiftProject4
//
//  Created by Flum-X on 2018/7/20.
//  Copyright © 2018年 Swift learning. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingCartButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var todoTitleField: UITextField!
    @IBOutlet weak var todoDatePicker: UIDatePicker!
    
    var todo: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let todo = todo {
            self.title = "Edit Todo"
            if todo.image == "child-selected"{
                childButton.isSelected = true
            }
            else if todo.image == "phone-selected"{
                phoneButton.isSelected = true
            }
            else if todo.image == "shopping-cart-selected"{
                shoppingCartButton.isSelected = true
            }
            else if todo.image == "travel-selected"{
                travelButton.isSelected = true
            }
            
            todoTitleField.text = todo.title
            todoDatePicker.setDate(todo.date, animated: false)
        } else {
            title = "New Todo"
            childButton.isSelected = true
        }
    }

    @IBAction func selectChild(_ sender: Any) {
        self.resetButtons()
        childButton.isSelected = true
    }
    
    @IBAction func selectPhone(_ sender: Any) {
        self.resetButtons()
        phoneButton.isSelected = true
    }
    
    @IBAction func selectShoppingCart(_ sender: Any) {
        self.resetButtons()
        shoppingCartButton.isSelected = true
    }
    
    @IBAction func selectTravel(_ sender: Any) {
        self.resetButtons()
        travelButton.isSelected = true
    }
    
    func resetButtons() {
        childButton.isSelected = false
        phoneButton.isSelected = false
        shoppingCartButton.isSelected = false
        travelButton.isSelected = false
    }
    
    @IBAction func tapDone(_ sender: Any) {
        var image = ""
        if childButton.isSelected {
            image = "child-selected"
        }
        else if phoneButton.isSelected {
            image = "phone-selected"
        }
        else if shoppingCartButton.isSelected {
            image = "shopping-cart-selected"
        }
        else if travelButton.isSelected {
            image = "travel-selected"
        }
        
        if let todo = todo {
            todo.image = image
            todo.title = todoTitleField.text!
            todo.date = todoDatePicker.date
        } else {
            let uuid = UUID().uuidString
            todo = ToDoItem(id: uuid, image: image, title: todoTitleField.text!, date: todoDatePicker.date)
            todos.append(todo!)
        }
        
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

}
