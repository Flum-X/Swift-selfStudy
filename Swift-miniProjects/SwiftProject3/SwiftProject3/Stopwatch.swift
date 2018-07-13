//
//  Stopwatch.swift
//  SwiftProject3
//
//  Created by Flum-X on 2018/7/13.
//  Copyright © 2018年 Swift learning. All rights reserved.
//

import Foundation

class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    
    override init() {
        counter = 0.0
        timer = Timer()
    }
    
}
