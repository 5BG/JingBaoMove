//
//  SalesDetailAddTableViewCell.swift
//  JingBao
//
//  Created by 5BG on 2016/2/12.
//  Copyright © 2016年 Sunny. All rights reserved.
//

import UIKit

class SalesDetailAddTableViewCell: UITableViewCell {

    @IBOutlet weak var lblItemID: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var lblUnitPrice: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblOperationDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
