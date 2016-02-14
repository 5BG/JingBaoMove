//
//  Item.swift
//  JingBao
//
//  Created by 5BG on 2015/11/17.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Foundation

class Item{
    
    var itemID: String?
    var itemName: String?
    var itemSpec: String?
    var itemImg: String?
    var sysID: String?
    
    init(){
        
    }
    
    init(itemID: String, itemName: String, itemSpec: String, itemImg: String, sysID: String){
        self.itemID = itemID
        self.itemName = itemName
        self.itemSpec = itemSpec
        self.itemImg = itemImg
        self.sysID = sysID
    }
    
    func setItemID(itemID: String){
        self.itemID = itemID
    }
    
    func getItemID() -> String{
        return itemID!
    }
    
    func setItemName(itemName: String){
        self.itemName = itemName
    }
    
    func getItemName() -> String{
        return itemName!
    }
    
    func setItemSpec(itemSpec: String){
        self.itemSpec = itemSpec
    }
    
    func getItemSpec() -> String{
        return itemSpec!
    }
    
    func setItemImg(itemImg: String){
        self.itemImg = itemImg
    }
    
    func getItemImg() -> String{
        return itemImg!
    }
    
    func setItemSysID(sysID: String){
        self.sysID = sysID
    }
    
    func getItemSysID() -> String{
        return sysID!
    }
}