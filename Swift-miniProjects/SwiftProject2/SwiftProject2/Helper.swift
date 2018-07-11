//
//  Helper.swift
//  SwiftProject2
//
//  Created by Flum-X on 2018/7/11.
//  Copyright © 2018年 Swift learning. All rights reserved.
//

import UIKit


enum Gender: Int {
    case Male = 0, Female
}

extension Selector {
    static let endEditing = #selector(UIView.endEditing(_:))
}

extension UIViewController {
    func showAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
