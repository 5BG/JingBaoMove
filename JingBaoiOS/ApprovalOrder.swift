//
//  ApprovalOrder.swift
//  JingBao
//
//  Created by 5BG on 2015/9/29.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Foundation

class ApprovalOrder{
    var orderNo: String?
    var type: String?
    var content: String?
    var img: String?
    var date: String?
    var status: String?
    var approval_remark: String?
    var corperated_partner: String?
    var corperated_partnername: String?
    var disscount: Double?
    var tax: Double?
    var total: Double?
    
   
    init(){
        
    }
    
    init(orderNo: String, type: String, content: String, img: String, date: String, status: String, approval_remark: String,
        corperated_partner: String, corperated_partnername: String, disscount: Double, tax: Double, total: Double)
    {
        self.orderNo = orderNo
        self.type = type
        self.content = content
        self.img = img
        self.date = date
        self.status = status
        self.approval_remark = approval_remark
        self.corperated_partner = corperated_partner
        self.corperated_partnername = corperated_partnername
        self.disscount = disscount
        self.tax = tax
        self.total = total
    }
    
    func setOrderNo(orderNo: String){
        self.orderNo = orderNo
    }
    
    func getOrderNo() -> String{
        return orderNo!
    }
    
    func setOrderType(orderType: String){
        self.type = orderType
    }
    
    func getOrderType() -> String{
        return type!
    }
    
    func setContent(content: String){
        self.content = content
    }
    
    func getContent() -> String{
        return content!
    }
    
    func setImage(img: String){
        self.img = img
    }
    
    func getImage(img: String){
        self.img = img
    }
    
    func getImage() -> String{
        return img!
    }
    
    func setOperationdate(date: String){
        self.date = date
    }
    
    func getOperationDate() -> String{
        return date!
    }
    
    func setApprovalRemark(approval_remark: String){
        self.approval_remark = approval_remark
    }
    
    func getApprovalRemark() -> String{
        return approval_remark!
    }
    
    func setCorperatedPartner(corperated_partner: String){
        self.corperated_partner = corperated_partner
    }
    
    func getCorperatedPartner() -> String{
        return corperated_partner!
    }
    
    func setCorperatedPartnerName(corperated_partnername: String){
        self.corperated_partnername = corperated_partnername
    }
    
    func getCorperatedPartnerName() -> String{
        return corperated_partnername!
    }
    
    func setDisscount(disscount: Double){
        self.disscount = disscount
    }
    
    func getDiscount() -> Double{
        return disscount!
    }
    
    func setTax(tax: Double){
        self.tax = tax
    }
    
    func getTax() -> Double{
        return tax!
    }
    
    func setTotal(total: Double){
        self.total = total
    }
    
    func getTotal() -> Double{
        return total!
    }
}