//
//  CustomerModel.swift
//  JingBao
//
//  Created by 5BG on 2015/10/7.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation


class CustomerModel{
    var monglab: MongoQuery = MongoQuery()
    var customerDataList: [Customer]?
    let dataLoadingNotificationKey = "dataLoadingNotificationKey"
    let dataLoadingPickNotificationKey = "dataLoadingPickNotificationKey"

    let dataLoadingAroundMeMapNotificationKey = "dataLoadingAroundMeMapNotificationKey"
    init(){
        
    }
    
    func qryCustomerDistanceCollections(){
        
        let returnJSON = monglab.getCollectionItemList("jingbao", collectionName: "CUSTOMER")
        customerDataList = []
        for item in returnJSON!.arrayValue{
            calCutomerDistanceKM(item["customer_address"].stringValue){
                (distance) in
  
                let customer = Customer(
                    customerID: item["customer_id"].stringValue,
                    customerName: item["customer_name"].stringValue,
                    zoneNum: item["zoneNum"].stringValue,
                    contactor: item["contactor"].stringValue,
                    customerAddress: item["customer_address"].stringValue,
                    customerDistance: distance,
                    sysID: item["sysid"].stringValue)
                
                if distance < 5{
                     self.customerDataList?.append(customer)
                     self.notifyLoadingAroundMeData()
                }
            }
        }
       
    }
    
    func qryCustomerCollections(){
        
        let returnJSON = monglab.getCollectionItemList("jingbao", collectionName: "CUSTOMER")
        customerDataList = []
        for item in returnJSON!.arrayValue{
                let customer = Customer(
                    customerID: item["customer_id"].stringValue,
                    customerName: item["customer_name"].stringValue,
                    zoneNum: item["zoneNum"].stringValue,
                    contactor: item["contactor"].stringValue,
                    customerAddress: item["customer_address"].stringValue,
                    customerDistance: 0,
                    sysID: item["sysid"].stringValue)
            
            self.customerDataList?.append(customer)
            self.notifyLoadingPickData()
        }
        
    }
    
    func qryCustomerData(params: String, collectionName: String){
        
        let returnJSON = monglab.getCollectionItemList("jingbao", collectionName: collectionName, query: params, countOnly: false, fields: "", findOne: false, sortOrder: "", skip: 0, limit: 0)
        let returnData = returnJSON!.arrayValue
        
        customerDataList = []
        for item in returnJSON!.arrayValue{
            var customer = Customer(
                customerID: item["customer_id"].stringValue,
                customerName: item["customer_name"].stringValue,
                zoneNum: item["zoneNum"].stringValue,
                contactor: item["contactor"].stringValue,
                customerAddress: item["customer_address"].stringValue,
                sysID: item["sysid"].stringValue)
            
                self.customerDataList?.append(customer)
                self.notifyLoadingData()
            }
        
    }
    
    func locateCustomerAddressHandler(address: String, locatedHandler:(location: CLLocationCoordinate2D?) -> ()){
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(address, completionHandler: {
            (placemarks, error) -> Void in
            
            if error != nil{
                print("Error: \(error)")
            }
            
            if let placemark = placemarks?.first{
                let coordinates = (placemark.location?.coordinate)!
                locatedHandler(location: coordinates)
                
            }
        })
    }
    
    private func notifyLoadingData()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(dataLoadingNotificationKey, object: nil)
    }
    
    private func notifyLoadingPickData()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(dataLoadingPickNotificationKey, object: nil)
    }
    
    private func notifyLoadingAroundMeData()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(dataLoadingAroundMeMapNotificationKey, object: nil)
    }
    
    func calCutomerDistanceKM(customerAddress: String, distanceHandler:(distance:Double)->()){
        locateCustomerAddressHandler(customerAddress){
            (location) in
            // calculate distances
            if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
                
                let userLocation = appDelegate.currentLocation
                let sourceL = CLLocation(latitude: (userLocation?.latitude)!, longitude: (userLocation?.longitude)!)
                let customerL = CLLocation(latitude: (location?.latitude)!, longitude: (location?.longitude)!)
                let distance = self.calDistanceKMBetweenTwoLocations(sourceL, destination: customerL)
                
                distanceHandler(distance: distance)
            } 
        }
    }
    
    func calDistanceKMBetweenTwoLocations(source: CLLocation, destination: CLLocation) -> Double
    {
        let distanceMeters = source.distanceFromLocation(destination)
        var distanceKM = distanceMeters / 1000
        
        return distanceKM
    }
    
}
