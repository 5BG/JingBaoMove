//
//  ApprovalDetailTableTableViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/10/4.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class ApprovalItemDetailTableViewController: UITableViewController {
    
    var sourceOrderNO = String()
    var orderType = String()
    var approvalDetailList = [ApprovalDetailInfo]()


    override func viewDidLoad() {
        super.viewDidLoad()

        //let image = UIImage(named: "locker")
        //var imageData = UIImagePNGRepresentation(image!)
        //let base64String = imageData!.base64EncodedStringWithOptions([])
        //print(base64String)
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
        return approvalDetailList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ApprovalDetailCell", forIndexPath: indexPath) as! ApprovalItemDetailTableViewCell
        // Configure the cell...
        let approvalDetail = approvalDetailList[indexPath.row]
        
        cell.txtItemID.text = approvalDetail.getItemID()
        cell.txtItemName.text = approvalDetail.getItemName()
        cell.txtCurrency.text = approvalDetail.getCurrency()
        cell.txtQuantity.text = approvalDetail.getQuantity()
        cell.txtUnitPrice.text = approvalDetail.getUnitPrice()
        cell.txtAmount.text = approvalDetail.getAmount()
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
