//
//  ApprovalDetailInfo.swift
//  JingBao
//
//  Created by 5BG on 2015/10/4.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Foundation

class ApprovalDetailInfo{
    
    var sequenceNo: String?
    var itemID: String?
    var itemName: String?
    var currency: String?
    var UM: String?
    var quantity: String?
    var unitPrice: String?
    var amount: String?
    
    init(sequenceNo: String, itemID: String, itemName: String, currency: String, UM: String, quantity: String, unitPrice: String, amount: String){
        
        self.sequenceNo = sequenceNo
        self.itemID = itemID
        self.itemName = itemName
        self.currency = currency
        self.UM = UM
        self.quantity = quantity
        self.unitPrice = unitPrice
        self.amount = amount
    }
    
    func setSequenceNo(sequenceNo: String){
        self.sequenceNo = sequenceNo
    }
    
    func getSequenceNo() -> String{
        return sequenceNo!
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
    
    func setCurrency(currency: String){
        self.currency = currency
    }
    
    func getCurrency() -> String{
        return currency!
    }
    
    func setPruchaseUM(UM: String){
        self.UM = UM
    }
    
    func getUM() -> String{
        return UM!
    }
    
    func setQuantity(quantity: String){
        self.quantity = quantity
    }
    
    func getQuantity() -> String{
        return quantity!
    }
    
    func setUnitPrice(unitPrice: String){
        self.unitPrice = unitPrice
    }
    
    func getUnitPrice() -> String{
        return unitPrice!
    }
    
    func setAmount(amount: String){
        self.amount = amount
    }
    
    func getAmount() -> String{
        return amount!
    }
}