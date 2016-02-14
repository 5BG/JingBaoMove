//
//  ItemDetailTableViewCell.swift
//  JingBao
//
//  Created by 5BG on 2015/11/21.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class ItemDetailTableViewCell: UITableViewCell {

    @IBOutlet var field: UILabel!
    @IBOutlet var value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
