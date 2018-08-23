//
//  PersistencyManager.swift
//  SwiftProject7
//
//  Created by DaXiong on 2018/8/22.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {
    
    func saveImage(_ image: UIImage, fileName: String) {
        let path = NSHomeDirectory() + "/Documents/\(fileName)"
        let data = UIImagePNGRepresentation(image)
        try? data!.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
    
    func getImage(_ fileName: String) -> UIImage? {
        let path = NSHomeDirectory() + "/Documents/\(fileName)"
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .uncachedRead)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }
}

