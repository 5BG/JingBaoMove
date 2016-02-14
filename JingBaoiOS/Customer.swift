//
//  Customer.swift
//  JingBao
//
//  Created by 5BG on 2015/10/7.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Foundation
import CoreLocation

class Customer {
    var customerID: String?
    var customerName: String?
    var zoneNum: String?
    var contactor: String?
    var customerAddress: String?
    var customerDistance: Double?
   
    var sysID: String?
    
    init(){
    
    }
    
    init(customerID: String, customerName: String, zoneNum: String, contactor: String, customerAddress: String, sysID: String){
        self.customerID = customerID
        self.customerName = customerName
        self.zoneNum = zoneNum
        self.contactor = contactor
        self.customerAddress = customerAddress
        
        self.sysID = sysID
    }
    
    init(customerID: String, customerName: String, zoneNum: String, contactor: String, customerAddress: String, customerDistance: Double, sysID: String){
        self.customerID = customerID
        self.customerName = customerName
        self.zoneNum = zoneNum
        self.contactor = contactor
        self.customerAddress = customerAddress
        self.customerDistance = customerDistance
        
        self.sysID = sysID
    }
    
    func setCustomerID(customerId: String){
        self.customerID = customerId
    }
    
    func getCustomerID() -> String{
        return customerID!
    }
    
    func setCustomerName(customerName: String){
        self.customerName = customerName
    }
    
    func getCustomerName() -> String{
        return customerName!
    }
    
    func setCustomerAddress(customerAddress: String){
        self.customerAddress = customerAddress
    }
    
    func getCustomerAddress() -> String{
        return customerAddress!
    }
    
    func setZoneNum(zoneNum: String){
        self.zoneNum = zoneNum
    }
    
    func getZoneNum() -> String{
        return zoneNum!
    }
    
    func setContactor(contactor: String){
        self.contactor = contactor
    }
    
    func getContactor() -> String{
        return contactor!
    }
    
    func setCustomerDistance(distance: Double){
        self.customerDistance = distance
    }
    
    func getCustomerDistance() -> Double{
        return customerDistance!
    }
}