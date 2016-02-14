//
//  InventoryViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/10/28.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class InventoryViewController: UIViewController, AroundMeTransitionManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
     let aroundMeTransitionManager = AroundMeTransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func draggingGesture(sender: UIPanGestureRecognizer) {
        
        print("draggingGesture")
        performSegueWithIdentifier("testSegue", sender: self)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let inventoryTableViewController = segue.destinationViewController as! InventoryTableViewController
        
//        inventoryTableViewController.transitioningDelegate = aroundMeTransitionManager
//        aroundMeTransitionManager.delegate = self
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
