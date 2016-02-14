//
//  CustomerTableViewCell.swift
//  JingBao
//
//  Created by 5BG on 2016/1/10.
//  Copyright © 2016年 Sunny. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {
   
    @IBOutlet weak var field: UILabel!
    @IBOutlet weak var value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
