//
//  Pokemon.swift
//  SwiftProject7
//
//  Created by DaXiong on 2018/8/22.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import Foundation

enum PokeType {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
}

class Pokemon: NSObject {
    let name: String
    let id: Int
    let detailInfo: String
    let type: [PokeType]
    let weak: [PokeType]
    let pokeImgUrl: String
    
    init(name: String, id: Int, detailInfo: String, type: [PokeType], weak: [PokeType], pokeImgUrl: String) {
        self.name = name
        self.id = id
        self.detailInfo = detailInfo
        self.type = type
        self.weak = weak
        self.pokeImgUrl = pokeImgUrl
    }
}
