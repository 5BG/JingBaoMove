//
//  ItemTableViewModel.swift
//  JingBao
//
//  Created by 5BG on 2015/11/17.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import Foundation

class ItemTableViewModel{
    
    var monglab: MongoQuery = MongoQuery()
    
    var itemList: [Item]?
    //var itemDetailList: [ApprovalDetailInfo]?
    let dataLoadingNotificationKey = "dataLoadingNotificationKey"

    func qryItemCollections(){
        
        let returnJSON = monglab.getCollectionItemList("jingbao", collectionName: "ITEM")
        itemList = []
        for item in returnJSON!.arrayValue{
            
            let item = Item(
                itemID: item["ITEMID"].stringValue,
                itemName: item["ITEMNAME"].stringValue,
                itemSpec: item["ITEMSPECIFICATION"].stringValue,
                itemImg: item["ITEMIMAGE"].stringValue,
                sysID: item["SYSID"].stringValue
            )
            itemList?.append(item)
            notifyLoadingData()
        }
    }
    
    private func notifyLoadingData()
    {
        NSNotificationCenter.defaultCenter().postNotificationName(dataLoadingNotificationKey, object: nil)
    }
}