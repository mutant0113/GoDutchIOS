//
//  EventTableViewCell.swift
//  godutch
//
//  Created by 方又生 on 2017/10/23.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

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
    }

}
