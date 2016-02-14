//
//  LocalPushNotificationViewController.swift
//  MenuTesting
//
//  Created by 5BG on 2015/7/24.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit

class LocalPushNotificationViewController: UIViewController {

    static func scheduleLocalNotification(){
  
            let localNotification = UILocalNotification()
            localNotification.alertBody = "5 approval orders should be approvaled."
            localNotification.alertTitle = "簽核通知"
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }

    func removeLocalNotification(){
        
    }
}
