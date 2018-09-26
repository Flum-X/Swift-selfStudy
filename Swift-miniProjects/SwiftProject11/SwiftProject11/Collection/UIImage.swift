//
//  UIImage.swift
//  Swift11
//
//  Created by DaXiong on 2018/9/20.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

extension UIImage {
    func thumbnailOfSize(_ size: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: size, height: size))
        let rect = CGRect(x: 0.0, y: 0.0, width: size, height: size)
        UIGraphicsBeginImageContext(rect.size)
        draw(in: rect)
        let thumbnail = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        return thumbnail!;
    }
}
