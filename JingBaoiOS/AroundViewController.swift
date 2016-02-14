//
//  CustomerAroundViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/10/8.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class AroundViewController: UIViewController{

    @IBOutlet var topView: UIView!
    
    @IBOutlet var bottomView: UIView!
    
    var customerModel = CustomerModel()
    var mapVC = AroundMapViewController()
    var aroundMeTVC = AroundMeTableViewController()

    var customerList: [Customer]?

    let dataLoadingAroundMeMapNotificationKey = "dataLoadingAroundMeMapNotificationKey"
    let loadingAroundMeMapNotificationKey = "loadingAroundMeMapNotificationKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadingAroundMeData", name: "dataLoadingAroundMeMapNotificationKey", object: nil)
        
        customerModel.qryCustomerDistanceCollections()

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func loadingAroundMeData(){
        customerList = customerModel.customerDataList!
        let mapVC = self.childViewControllers.first as! AroundMapViewController
        let statusVC = self.childViewControllers.last as! AroundStatusBarViewController
        
        mapVC.customerList = customerList
        statusVC.customerList = customerList
        if customerList!.count > 0
        {
            if customerList!.count == 1
            {
                statusVC.numOfCustomer.text = " There is \(customerList!.count ) customer around you."
            }
            statusVC.numOfCustomer.text = " There are \(customerList!.count ) customers around you."
        }else{
            statusVC.numOfCustomer.text = " There is no customer around you."
        }
        notify()
    }
    
    func notify(){
        NSNotificationCenter.defaultCenter().postNotificationName(loadingAroundMeMapNotificationKey, object: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if let dataList = customerList{
            
            if segue.identifier == "AroundMeMapEmbedSegue"{
                let mapVC = self.childViewControllers.first as! AroundMapViewController
                mapVC.customerList = dataList
            }
            
            if segue.identifier == "AroundMeStatusBarEmbedSegue"{
                let statusVC = self.childViewControllers.last as! AroundMeTableViewController
                statusVC.customerList = dataList
            }
        }
        
    }
   
}
