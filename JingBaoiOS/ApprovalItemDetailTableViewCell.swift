//
//  ApprovalDetailTableViewCell.swift
//  JingBao
//
//  Created by 5BG on 2015/10/4.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class ApprovalItemDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var txtItemID: UILabel!
    @IBOutlet weak var txtItemName: UILabel!
    @IBOutlet var txtQuantity: UITextField!
    @IBOutlet var txtCurrency: UITextField!
    @IBOutlet var txtUnitPrice: UITextField!
    @IBOutlet weak var txtAmount: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
