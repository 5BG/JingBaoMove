//
//  SalesDetail.swift
//  JingBao
//
//  Created by 5BG on 2016/2/13.
//  Copyright © 2016年 Sunny. All rights reserved.
//

import Foundation

class SalesDetail{
    
    var itemImg: String?
    var itemID: String?
    var qty: Double = 0.0
    var unitPrice: Double = 0.0
    var scheduledDate: String?
    var amount: Double = 0.0
    var sysID :String?
    
    var detailSysID :String?
    
    init(){
        
    }
    
    init(itemImg: String, itemID: String, qty: Double, unitPrice: Double, scheduledDate: String, amount: Double, sysID: String, detailSysID: String)
    {
        self.itemImg = itemImg
        self.itemID = itemID
        self.qty = qty
        self.unitPrice = unitPrice
        self.scheduledDate = scheduledDate
        self.sysID = sysID
        self.detailSysID = detailSysID
    }
    
    
    func setItemImg(itemImg: String){
        self.itemImg = itemImg
    }
    
    func getItemImg() -> String{
        return itemImg!
    }
    
    func setItemID(itemID: String){
        self.itemID = itemID
    }
    
    func getItemID() -> String{
        return itemID!
    }
    
    func setQty(qty: Double){
        self.qty = qty
    }
    
    func getQty() -> Double{
        return qty
    }
    
    func setUnitPrice(unitPrice: Double){
        self.unitPrice = unitPrice
    }
    
    func getUnitPrice() -> Double{
        return unitPrice
    }
    
    func setScheduledDate(scheduledDate: String){
        self.scheduledDate = scheduledDate
    }
    
    func getScheduledDate() -> String{
        return scheduledDate!
    }
    
    func setAmount(amount: Double){
        self.amount = amount
    }
    
    func getAmount() -> Double{
        return amount
    }
    
    func setSysID(sysID: String){
        self.sysID = sysID
    }
    
    func getSysID() -> String{
        return sysID!
    }
    
    func setDetailSysID(detailSysID: String){
        self.detailSysID = detailSysID
    }
    
    func getDetailSysID() -> String{
        return detailSysID!
    }

}