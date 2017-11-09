//
//  FriendWithDeptTableViewCell.swift
//  godutch
//
//  Created by 方又生 on 2017/11/2.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit

class FriendWithDeptTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mImageViewPhoto: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
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
