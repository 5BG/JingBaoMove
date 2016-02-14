//
//  ApprovalTableViewModel.swift
//  JingBao
//
//  Created by 5BG on 2015/9/29.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Foundation

class ApprovalTableViewModel {
    
    var monglab: MongoQuery = MongoQuery()
   
    var approvalOrderList: [ApprovalOrder]?
    var approvalDetailList: [ApprovalDetailInfo]?
    
    let dataLoadingNotificationKey = "dataLoadingNotificationKey"
    let dataDetailLoadingNotificationKey = "dataDetailLoadingNotificationKey"
    
    init(){
        
    }
    
    func qryApprovalOrderCollections(){
        
        let returnJSON = monglab.getCollectionItemList("jingbao", collectionName: "PERSONALWORKAPPROVAL")
        approvalOrderList = []
        for item in returnJSON!.arrayValue{
            
            let approvalOrder = ApprovalOrder(
                orderNo: item["approval_sourceOrderNO"].stringValue,
                type: item["approval_orderType"].stringValue,
                content: item["approval_message"].stringValue,
                img: item["approval_image"].stringValue,
                date: item["approval_postDate"].stringValue,
                status: item["approval_status"].stringValue,
                approval_remark: item["approval_remark"].stringValue,
                corperated_partner: item["corperated_partner"].stringValue,
                corperated_partnername: item["corperated_partnername"].stringValue,
                disscount: item["disscount"].doubleValue,
                tax: item["tax"].doubleValue,
                total: item["total"].doubleValue
            )
            approvalOrderList?.append(approvalOrder)
            notifyLoadingData()
        }
    }
    
    func qryApprovalOrderDetial(params: String, collectionName: String){
        
        let returnJSON = monglab.getCollectionItemList("jingbao", collectionName: collectionName, query: params, countOnly: false, fields: "", findOne: false, sortOrder: "", skip: 0, limit: 0)
        let returnData = returnJSON!.arrayValue
       
        let dataArray = returnData[0]["DATA"]
        approvalDetailList = []
        let currency = returnData[0]["CURRENCYNAME"].stringValue
        for item in dataArray.arrayValue{
            var approvalDetail:ApprovalDetailInfo?
            if collectionName == "PURCHASEORDER"{
                approvalDetail = ApprovalDetailInfo(
                    sequenceNo: item["SEQUENCENO"].stringValue,
                    itemID: item["ITEMID"].stringValue,
                    itemName: item["ITEMNAME"].stringValue,
                    currency: currency,
                    UM: item["PURCHASEUM"].stringValue,
                    quantity: item["PURCHASEQUANTITY"].stringValue,
                    unitPrice: item["UNITPRICE"].stringValue,
                    amount: item["PURCHASEAMOUNT"].stringValue
            
                )
            }else if collectionName == "SALESORDER"{
                approvalDetail = ApprovalDetailInfo(
                    sequenceNo: item["SEQUENCENO"].stringValue,
                    itemID: item["ITEMID"].stringValue,
                    itemName: item["ITEMNAME"].stringValue,
                    currency: currency,
                    UM: item["SALESUM"].stringValue,
                    quantity: item["SALESQUANTITY"].stringValue,
                    unitPrice: item["UNITPRICE"].stringValue,
                    amount: item["SALESAMOUNT"].stringValue
                    
                )            }
            approvalDetailList?.append(approvalDetail!)
            notifyLoadingDetailData()
        }
    }
    
    private func notifyLoadingData()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(dataLoadingNotificationKey, object: nil)
    }
    
    private func notifyLoadingDetailData()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(dataDetailLoadingNotificationKey, object: nil)
    }
}
