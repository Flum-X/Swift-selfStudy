//
//  DXProductVC.swift
//  SwiftProject1
//
//  Created by Flum-X on 2018/7/5.
//  Copyright © 2018年 Swift learning. All rights reserved.
//

import UIKit

class DXProductVC: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLb: UILabel!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productNameLb.text = product?.name
        
        if let imageName = product?.fullscreenImageName {
            productImageView.image = UIImage(named: imageName)
        }
        
    }

    @IBAction func addToCartBtnClicked(_ sender: UIButton) {
        print("Add to cart successfully")
    }
    
}
