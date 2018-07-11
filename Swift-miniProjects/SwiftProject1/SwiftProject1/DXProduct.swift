//
//  DXProduct.swift
//  SwiftProject1
//
//  Created by Flum-X on 2018/7/5.
//  Copyright © 2018年 Swift learning. All rights reserved.
//

import Foundation

class Product {
    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?
    
    init(name: String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }
    
}
