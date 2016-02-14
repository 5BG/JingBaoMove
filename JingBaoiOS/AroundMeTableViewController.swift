//
//  AroundMeTableViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/10/9.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class AroundMeTableViewController: UITableViewController {

    var customerList = [Customer]()
    var aroundMeVC = AroundMapViewController()
    var selectedIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
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
        
        return customerList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AroundMeCell", forIndexPath: indexPath) as! AroundMeTableViewCell
        
        let customer = customerList[indexPath.row]
        // Configure the cell...
        cell.lblCusomerName.text = customer.getCustomerName()
        cell.lblCustomerAddress.text = customer.getCustomerAddress()
        let nf = NSNumberFormatter()
        nf.numberStyle = NSNumberFormatterStyle.DecimalStyle
        nf.maximumFractionDigits = 2
        cell.lblDistance.text = nf.stringFromNumber(customer.getCustomerDistance())!+" km"
        cell.lblContactor.text = customer.getContactor()
        
        cell.imgGPS.tag = indexPath.row;
        
        cell.imgCall.tag = indexPath.row;
        
        
        
        return cell
    }
   
    @IBAction func unwindToSegue(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func refreshTableView()
    {
        self.tableView.reloadData()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "gpsSegue"{
            
            let naviVC = segue.destinationViewController as! UINavigationController
            if let index = selectedIndex{
               let gpsVC = naviVC.topViewController as! GPSViewController
               gpsVC.destination = customerList[index]
                
            }
        }
    }
    
    func loadingAroundMeTableView(){
       
        refreshTableView()
    }
    
    @IBAction func btnGPS(sender: UIButton) {
        print("click GPS Button \(sender.tag)")
        selectedIndex = sender.tag
        performSegueWithIdentifier("gpsSegue", sender: self)
    }
    
    @IBAction func actionCalling(sender:UIButton){
        print("click Calling Button \(sender.tag)")
        selectedIndex = sender.tag
        
        let selectedCustomer = customerList[selectedIndex!]
//        var url = NSURL(string: "tel://\(selectedCustomer.getCusomerID())")
         var url = NSURL(string: "tel://+886937593103")
        UIApplication.sharedApplication().openURL(url!)
    }

}
