//
//  UploadViewController.swift
//  MenuTesting
//
//  Created by 5BG on 2015/7/20.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class TOUploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMenu(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewControllerWithIdentifier(Constant.MENU_IDENTITY) as! JingBaoApplicationViewController
        let initNavi = UINavigationController(rootViewController: menu)
        self.presentViewController(initNavi, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
