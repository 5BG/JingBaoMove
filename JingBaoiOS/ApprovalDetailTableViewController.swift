//
//  ApprovalDetailTableViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/12/22.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class ApprovalDetailTableViewController: UITableViewController {

    @IBOutlet weak var lblApprovalNo: UILabel!
    @IBOutlet weak var lblApprovalType: UILabel!
    @IBOutlet weak var lblRemark: UILabel!
    @IBOutlet weak var lblPartner: UILabel!
    @IBOutlet weak var lblPartnerName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblDetailCount: UILabel!
    
    var approvalOrder = ApprovalOrder()
    var approvalDetailList: [ApprovalDetailInfo]?
    var itemDetailCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        lblApprovalNo.text = approvalOrder.orderNo
        lblApprovalType.text = approvalOrder.type
        lblRemark.text = approvalOrder.approval_remark
        lblPartner.text = approvalOrder.corperated_partner
        lblPartnerName.text = approvalOrder.corperated_partnername
        lblDate.text = approvalOrder.date
        lblDiscount.text = (approvalOrder.disscount?.description)! + "%"
        lblTax.text = (approvalOrder.tax?.description)! + "$"
        lblTotal.text = (approvalOrder.total?.description)! + "$"
        lblDetailCount.text = itemDetailCount.description + "筆"
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
        return 12
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedRow = indexPath.row
        
        if(selectedRow == 3){
            self.performSegueWithIdentifier("showCustomerInfo", sender: self)
        }else if(selectedRow == 9){
            self.performSegueWithIdentifier("showItemDetail", sender: self)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showItemDetail"{
            
            let destinationVC = segue.destinationViewController as! ApprovalItemDetailTableViewController
           
            destinationVC.approvalDetailList = approvalDetailList!

        }
        else if segue.identifier == "showCustomerInfo"{
            
            let destinationVC = segue.destinationViewController as! CustomerPageViewController
            
            destinationVC.customerID = lblPartner.text!
            destinationVC.customerName = lblPartnerName.text!
            
        }
    }
    

}
