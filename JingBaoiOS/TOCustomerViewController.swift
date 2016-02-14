//
//  CustomerViewController.swift
//  MenuTesting
//
//  Created by 5BG on 2015/7/9.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit
import MapKit



class TOCustomerViewController: UIViewController, UITextFieldDelegate, CustomerPickTableViewControllerDelegate{
    
    @IBOutlet var txtCustomerID: UITextField!
    @IBOutlet weak var txtVaildDate: UITextField!
   
    @IBOutlet weak var txtCustomerName: UILabel!
    
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var txtIssueDate: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    
    var customerList = [Customer]()
    var customerModel = CustomerModel()
    //var customerPick: CustomerPickTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        datePickerView.hidden = true
        txtVaildDate.text = getTimestamp()
        txtIssueDate.text = getTimestamp()
        initNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
  
//    func textFieldDidEndEditing(textField: UITextField) {
//        let queryStr = "{\"customer_id\":\"\(txtCustomerID.text!)\"}"
//        customerModel.qryCustomerData(queryStr, collectionName: "CUSTOMER")
//    }
    
    @IBAction func backToMenu(sender: UIBarButtonItem){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewControllerWithIdentifier(Constant.MENU_IDENTITY) as! JingBaoApplicationViewController
        let initNavi = UINavigationController(rootViewController: menu)
        self.presentViewController(initNavi, animated: true, completion: nil)

    }
    
//    func loadingTableView()
//    {
//        customerList = customerModel.customerDataList!
//        
//        let customer = customerList[0]
//        txtCustomerName.text = customer.getCustomerName()
//        txtCustomerAddress.text = customer.getCustomerAddress()
//        
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let customerPickTVC = storyboard?.instantiateViewControllerWithIdentifier("CustomerPick") as! CustomerPickTableViewController
            customerPickTVC.mDelegate = self
        
        let navController = UINavigationController(rootViewController: customerPickTVC) // Creating a navigation controller with VC1 at the root of the navigation stack.
        self.presentViewController(navController, animated:true, completion: nil)
    }

    // 選取客戶按鈕
    @IBAction func btnCustomerPicker(sender: AnyObject) {
        
        self.performSegueWithIdentifier("CustomerPick", sender: nil)
    }
    
    // 有效日期 datePicker
    @IBAction func btnVaildDate(sender: UIButton) {
        datePickerView.hidden = false
        //datePickerView.backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        
        datePicker.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
       
    }
    
     // 設定有效日期 format & date
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        txtVaildDate.text = dateFormatter.stringFromDate(sender.date)
        
    }

    // click Done button
    @IBAction func btnDatePickerDone(sender: UIBarButtonItem) {
         datePickerView.hidden = true
        
    }
    
    // get Current Date
    func getTimestamp() -> String{
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let timestamp = dateFormatter.stringFromDate(NSDate())
        return timestamp
    }
    
    @IBAction func bgHit(sender: UITapGestureRecognizer) {
        
        txtCustomerID.resignFirstResponder()
        txtVaildDate.resignFirstResponder()
    }
    
    func setCustomerPick(customerPick: Customer)
    {
        print("setCustomerPickID: \(customerPick.customerID!)")
        txtCustomerID.text = customerPick.customerID!
        txtCustomerName.text = customerPick.customerName!
        txtCustomerName.textColor = UIColor.blackColor()
    }
    
    // Tab Controller NavigationBar
    func initNavigationBar()
    {
        self.tabBarController?.navigationItem.title = "客戶資料"
        self.tabBarController?.navigationItem.titleView?.tintColor = UIColor.whiteColor()
    }
    
}
