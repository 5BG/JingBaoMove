//
//  AppDelegate.swift
//  MenuTesting
//
//  Created by 5BG on 2015/7/6.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate{

    var window: UIWindow?
    var locationManager: CLLocationManager?
    var seenError : Bool = false
    var locationFixAchieved : Bool = false
    var locationStatus : NSString = "Not Started"
    var currentLocation: CLLocationCoordinate2D?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let setting = UIUserNotificationSettings(forTypes: [.Alert, .Sound], categories: nil)
        application.registerUserNotificationSettings(setting)
        UIApplication.sharedApplication().setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
       
        initLocationManager()

        return true
    }
    
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        print("Complete");
        completionHandler(UIBackgroundFetchResult.NoData)
        
        getData();
        
    }
    
    func getData() -> Void{
        
//        let localNotification = UILocalNotification()
//        
//        localNotification.alertTitle = "簽核通知"
//        localNotification.alertBody = "您有5筆單據尚未簽核."
//        localNotification.soundName = UILocalNotificationDefaultSoundName
//        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
//        
//        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
//        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
//        
//        print("Background: \(timestamp)")
  
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //print("applicationDidEnterBackground")
        getData()
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        //print("applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // Location Manager helper stuff
    func initLocationManager() {
        seenError = false
        locationFixAchieved = false
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        locationManager?.pausesLocationUpdatesAutomatically = false
        
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        locationManager!.requestAlwaysAuthorization()
        locationManager!.startUpdatingLocation()
        locationManager?.distanceFilter = CLLocationDistance(10)
    }
    
    // Location Manager Delegate stuff
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        manager.stopUpdatingLocation()
       
//        if let errorInfo != nil{
//            if seenError == false{
//                seenError = true
//                print(error)
//            }
//        }
        print(error.code)
//        switch(error.code){
//            case kCLErrorNetwork:
//                let alert = UIAlertView(title: "ErrorMessage", message: "please check your network connection or that you are not in airplane mode", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: nil, nil)
//                alert.
//            case kCLErrorDenied:
//                let alert = UIAlertView(title: "ErrorMessage", message: "user has denied to use current Location", delegate: self, cancelButtonTitle: "OK")
//            case default:
//                break
//        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let c = locations[0] as  CLLocation
        
        currentLocation = CLLocationCoordinate2D(latitude: c.coordinate.latitude, longitude:
            c.coordinate.longitude)
    }
    
    func locationManager(manager: CLLocationManager,
        didChangeAuthorizationStatus status: CLAuthorizationStatus){
            
            print("The authorization status of location " +
                "services is changed to: ", terminator: "")
            
            switch CLLocationManager.authorizationStatus(){
            case .Denied:
                print("Denied")
            case .NotDetermined:
                print("Not determined")
            case .Restricted:
                print("Restricted")
            default:
                print("Authorized")
                // Start location services
                locationManager!.startUpdatingLocation()
            }
            
    }
    
    func displayAlertWithTitle(title: String, message: String){
        let controller = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "OK",
            style: .Default,
            handler: nil))
        
//        presentViewController(controller, animated: true, completion: nil)
        
    }
    
    
    
}

