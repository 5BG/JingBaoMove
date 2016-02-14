//
//  CustomerPickTableViewCell.swift
//  JingBao
//
//  Created by 5BG on 2016/1/13.
//  Copyright © 2016年 Sunny. All rights reserved.
//

import UIKit

class CustomerPickTableViewCell: UITableViewCell {

    @IBOutlet weak var imgeView: UIImageView!
    @IBOutlet weak var lblCustomerID: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
