//
//  SalesDetailNavigationController.swift
//  MenuTesting
//
//  Created by 5BG on 2015/9/22.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class TOSalesDetailNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
        // Do any additional setup after loading the view.
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
        
        if segue.identifier == "SalesDetailVC"{
            
            let vc = segue.destinationViewController as! TODetailViewController
        }else{
            let vc = segue.destinationViewController as! TOSalesDetailTableViewController
        }
    }
    
    func initLayout(){
        let isData = true
        if(isData){
            self.performSegueWithIdentifier("SalesDetailTableViewSegue", sender: self)
        }else{
            self.performSegueWithIdentifier("SalesDetailVC", sender: self)
        }
    }
    

}
