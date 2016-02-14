//
//  AroundStatusBarViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/11/3.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class AroundStatusBarViewController: UIViewController,AroundMeTransitionManagerDelegate {

    var customerList: [Customer]?
    @IBOutlet var numOfCustomer: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numOfCustomer.text = String (customerList?.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "AroundMeTVSegue"{
           let naviVC = segue.destinationViewController as! UINavigationController
           let aroundMeTVC = naviVC.topViewController as! AroundMeTableViewController
            aroundMeTVC.customerList = customerList!
        }
        
    }
   
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
