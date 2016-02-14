//
//  ViewController.swift
//  MenuTesting
//
//  Created by 5BG on 2015/7/6.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class JingBaoApplicationViewController: UIViewController {

    var updateTimer: NSTimer?
    var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //NSThread.sleepForTimeInterval(3.0)//延长3秒
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapTakeOrder(sender: UIButton!)
    {
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let takeOrderTabBar = storyboard.instantiateViewControllerWithIdentifier(Constant.TAKEORDER_IDENTITY) as! TOTabBarViewController
        //self.presentViewController(takeOrderTabBar, animated: true, completion: nil)
    }
    
    @IBAction func tapApproval(sender: UITapGestureRecognizer) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let approval = storyboard.instantiateViewControllerWithIdentifier(Constant.APPROVAL_IDENTITY) as! UINavigationController
        self.presentViewController(approval, animated: true, completion: nil)
    }
    
    func doPushNotification(){
        let priority = DISPATCH_QUEUE_PRIORITY_BACKGROUND
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            // do some task
            if UIApplication.sharedApplication().applicationState == .Active {
                 LocalPushNotificationViewController.scheduleLocalNotification()
            } else {
                let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
                
                print("Background: \(timestamp)")
                
            }
            
            dispatch_async(dispatch_get_main_queue()) {
                // update some UI
                //LocalPushNotificationViewController.scheduleLocalNotification()
            }
        }
    }
}

