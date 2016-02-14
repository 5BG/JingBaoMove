//
//  SalesDetailAddViewController.swift
//  MenuTesting
//
//  Created by 5BG on 2015/8/24.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class TOSalesDetailAddViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnAdd(sender: UIBarButtonItem) {
        print("btnAdd")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let salesDetailTableVC = storyboard.instantiateViewControllerWithIdentifier("SalesDetailTableVC") as! UITableViewController
        
//        self.presentViewController(salesDetailTableVC, animated: false, completion: {})
        //self
        
        self.navigationController?.pushViewController(salesDetailTableVC, animated: true)
    }
    
   
    @IBAction func btnCancel(sender: UIBarButtonItem) {
        print("btnCancel")
        self.dismissViewControllerAnimated(true, completion: {})
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue == "SalesDetailTableView"{
//            self.performSegueWithIdentifier("SalesDetailTableView", sender: self)
        }
    }
    

}
