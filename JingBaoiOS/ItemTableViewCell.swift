//
//  ItemTableViewCell.swift
//  JingBao
//
//  Created by 5BG on 2015/11/17.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet var itemImg: UIImageView!
    @IBOutlet var itemID: UILabel!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemSpec: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
