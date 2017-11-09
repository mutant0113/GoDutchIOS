//
//  GroupTableViewCell.swift
//  godutch
//
//  Created by 方又生 on 2017/10/20.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mImageViewPhoto: UIImageView!
    @IBOutlet weak var mLabelTitle: UILabel!
    @IBOutlet weak var mLabelTotal: UILabel!
    @IBOutlet weak var mLabelDebt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
