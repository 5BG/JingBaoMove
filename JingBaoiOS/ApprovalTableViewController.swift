//
//  ApprovalTableViewController.swift
//  MenuTesting
//
//  Created by 5BG on 2015/7/16.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit
import SwiftyJSON

class ApprovalTableViewController: UITableViewController {
    
    var approvalModel = ApprovalTableViewModel()
    var params = [String:AnyObject]()
    var approvalOrderList = [ApprovalOrder]()
    var approvalDetailList: [ApprovalDetailInfo]?
    var selectedOrder = ApprovalOrder()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 36.0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadingTableView", name: "dataLoadingNotificationKey", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadingDetailTableView", name: "dataDetailLoadingNotificationKey", object: nil)
        
        approvalModel.qryApprovalOrderCollections()
        //tableView.rowHeight = UITableViewAutomaticDimension
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return approvalOrderList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ApprovalCell", forIndexPath: indexPath) as! ApprovalTableViewCell
        let approvalOrder = approvalOrderList[indexPath.row]
        let base64String = approvalOrder.getImage()
        if !base64String.isEmpty{
            let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0))
            if decodedData != nil{
                let decodedimage = UIImage(data: decodedData!)
                cell.img.image = decodedimage
            }
        }

        cell.lblApprovalOrderNo.text = approvalOrder.getOrderNo()
        cell.lblApprovalType.text = approvalOrder.getOrderType()
        cell.lblApprovalContent.text = approvalOrder.getContent()
        cell.lblOperationDate.text = approvalOrder.getOperationDate()
        // Configure the cell...
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        approvalDetailList = [ApprovalDetailInfo]()
        selectedOrder = approvalOrderList[indexPath.row]
        self.performSegueWithIdentifier("showDetail", sender: self)
        
//        self.performSegueWithIdentifier("showDetail", sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let destinationController = segue.destinationViewController as! ApprovalDetailTableViewController
                destinationController.approvalOrder = approvalOrderList[indexPath.row]
                
                var queryStr: String?
                var collectionName: String?
                if selectedOrder.getOrderType() == "PO"{
                    queryStr = "{\"PONO\":\"\(selectedOrder.getOrderNo())\"}"
                    collectionName = "PURCHASEORDER"
                }else if selectedOrder.getOrderType() == "SO"{
                    queryStr = "{\"SONO\":\"\(selectedOrder.getOrderNo())\"}"
                    collectionName = "SALESORDER"
                }
    
                approvalModel.qryApprovalOrderDetial(queryStr!, collectionName: collectionName!)
                destinationController.itemDetailCount = approvalDetailList!.count
                destinationController.approvalDetailList = approvalDetailList!
            }
            
//            let destinationVC = segue.destinationViewController as! ApprovalItemDetailTableViewController
//            var queryStr: String?
//            var collectionName: String?
//            if selectedOrder.getOrderType() == "PO"{
//                queryStr = "{\"PONO\":\"\(selectedOrder.getOrderNo())\"}"
//                collectionName = "PURCHASEORDER"
//            }else if selectedOrder.getOrderType() == "SO"{
//                queryStr = "{\"SONO\":\"\(selectedOrder.getOrderNo())\"}"
//                collectionName = "SALESORDER"
//            }
//            
//            approvalModel.qryApprovalOrderDetial(queryStr!, collectionName: collectionName!)
//            destinationVC.approvalDetailList = approvalDetailList!
        }
        
    }
    
    
    /*@IBAction func backToMenu(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewControllerWithIdentifier(Constant.MENU_IDENTITY) as! JingBaoApplicationViewController
        let initNavi = UINavigationController(rootViewController: menu)
        self.presentViewController(initNavi, animated: true, completion: nil)
    }*/
    

    func loadingTableView()
    {
        approvalOrderList = approvalModel.approvalOrderList!
    }
    
    func loadingDetailTableView()
    {
        approvalDetailList = approvalModel.approvalDetailList
    }
}
