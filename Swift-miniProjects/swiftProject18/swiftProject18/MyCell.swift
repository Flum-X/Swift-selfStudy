//
//  MyCell.swift
//  swiftProject18
//
//  Created by DaXiong on 2018/12/23.
//  Copyright © 2018 DaXiong. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var contentLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
