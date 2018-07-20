//
//  ToDoItem.swift
//  SwiftProject4
//
//  Created by Flum-X on 2018/7/20.
//  Copyright © 2018年 Swift learning. All rights reserved.
//

import Foundation

class ToDoItem: NSObject {
    var id: String
    var image: String
    var title: String
    var date: Date
    
    init(id: String, image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
