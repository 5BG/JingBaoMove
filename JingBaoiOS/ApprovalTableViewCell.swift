//
//  ApprovalTableViewCell.swift
//  MenuTesting
//
//  Created by 5BG on 2015/7/20.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class ApprovalTableViewCell: UITableViewCell {

    @IBOutlet var lblApprovalOrderNo: UILabel!
    @IBOutlet var lblApprovalContent: UILabel!
    @IBOutlet var lblApprovalType: UILabel!
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var lblOperationDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
