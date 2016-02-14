//
//  MongoLab.swift
//  JingBao
//
//  Created by 5BG on 2015/9/24.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Alamofire
import SwiftyJSON

class MongoQuery {
    
    // Every query goesto this URL. URL of the app DB
    let BASE_URL = "https://api.mongolab.com/api/1/databases/jingbao/collections/"
    // Put your API key to access MongoLab services.
    let URL_API_KEY = "z8x2aZOwQW7ZZBK_SqwaZJX19CEKyBF6"
    
    var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
    
    var error: NSError?
    
    init(){
        
    }
    
    func getCollectionList(databaseName: String) {
        
        let urlStr = "https://api.mongolab.com/api/1/databases/\(databaseName)/collections?apiKey=" + URL_API_KEY
        let urlRequest = NSMutableURLRequest(URL: NSURL(string: urlStr)!)
        urlRequest.HTTPMethod = "GET"
        urlRequest.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        do{
            let receivedData =  try NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: response)
            if receivedData.length != 0{
                
                let jsonStr = NSString(data: receivedData, encoding: NSUTF8StringEncoding)
                
                print(jsonStr!)
            }
            
        }catch{
            print(error)
        }
    }
    
    func getCollectionItemList(databaseName: String, collectionName: String) -> JSON?{
        let urlStr = "https://api.mongolab.com/api/1/databases/\(databaseName)/collections/\(collectionName)?apiKey=" + URL_API_KEY
        let urlRequest = NSMutableURLRequest(URL: NSURL(string: urlStr)!)
        urlRequest.HTTPMethod = "GET"
        urlRequest.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        do{
            let receivedData =  try NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: response)
            if receivedData.length != 0{
                
                let jsonStr = NSString(data: receivedData, encoding: NSUTF8StringEncoding)
                //let json = JSON(jsonStr!)
                 var json = try NSJSONSerialization.JSONObjectWithData(receivedData, options: NSJSONReadingOptions.AllowFragments)
                
                return JSON(json)
            }
            
        }catch{
            print(error)
        }
        return nil
    }
    
    func getCollectionItemList(databaseName: String, collectionName: String, query: String, countOnly: Bool, fields: String, findOne: Bool, sortOrder: String, skip: Int, limit: Int) -> JSON?{
        
        var urlString = String()
        var queryParams:String?
        
        if !query.isEmpty {
            queryParams = "&q=\(query.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)"
        }
        
        var fieldsParams = String()
        if !fields.isEmpty{
            fieldsParams = "&f=\(fields)"
        }
        
        var findOneParams = String()
        
        if findOne{
            findOneParams = "&fo=true"
        }
        
        var sortOrderParams = String()
        
        if !sortOrder.isEmpty{
            sortOrderParams = "&s=\(sortOrder)"
        }
        
        var skipParams = String()
        if skip > 0{
            skipParams = "&sk=\(skip)"
        }
        
        var limitParams = String()
        if limit > 0{
            limitParams = "&l=\(limit)"
        }
       
        urlString = "https://api.mongolab.com/api/1/databases/\(databaseName)/collections/\(collectionName)?apiKey=" + URL_API_KEY + "\(queryParams!)\(fieldsParams)\(findOneParams)\(sortOrderParams)\(skipParams)\(limitParams)"
        //print(urlString)
        let urlRequest = NSMutableURLRequest(URL: NSURL(string: urlString)!)
        urlRequest.HTTPMethod = "GET"
        urlRequest.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        do{
            let receivedData =  try NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: response)
            if receivedData.length != 0{
                
                let jsonStr = NSString(data: receivedData, encoding: NSUTF8StringEncoding)
                //let json = JSON(jsonStr!)
                var json = try NSJSONSerialization.JSONObjectWithData(receivedData, options: NSJSONReadingOptions.AllowFragments)
                
                return JSON(json)
            }
            
        }catch{
            print(error)
        }
        return nil
        
    }
        
    
}


    

    



