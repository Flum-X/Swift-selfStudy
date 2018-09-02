//
//  FBMeUser.swift
//  SwiftProject9
//
//  Created by DaXiong on 2018/9/2.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

class FBMeUser {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "bayMax", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
