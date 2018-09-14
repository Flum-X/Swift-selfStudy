//
//  InterestCollectionViewCell.swift
//  SwiftProject10
//
//  Created by DaXiong on 2018/9/14.
//  Copyright © 2018年 DaXiong. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var interest: Interest {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        titleLabel.text = interest.title
        featuredImageView.image = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}
