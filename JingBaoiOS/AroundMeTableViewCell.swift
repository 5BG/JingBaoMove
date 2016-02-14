//
//  ArroundMeTableViewCell.swift
//  JingBao
//
//  Created by 5BG on 2015/10/9.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class AroundMeTableViewCell: UITableViewCell {

    
    @IBOutlet var imgGPS: UIButton!
    @IBOutlet var imgCall: UIButton!
    @IBOutlet var lblCusomerName: UILabel!
    @IBOutlet var lblCustomerAddress: UILabel!
    @IBOutlet var lblContactor: UILabel!
    @IBOutlet var lblDistance: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
