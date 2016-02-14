//
//  AroundMapViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/11/3.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AroundMapViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var aroundMeMap: MKMapView!
    
    var customerModel = CustomerModel()
    var customerList: [Customer]?
    var currentLocation: CLLocationCoordinate2D?
    let regionRadius: CLLocationDistance = 1000
  
    
    let loadingAroundMeMapNotificationKey = "loadingAroundMeMapNotificationKey"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadingAroundMeMap", name: "loadingAroundMeMapNotificationKey", object: nil)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addPointAnnotation(coodinates: CLLocationCoordinate2D){
        
        var point = MKPointAnnotation()
        point.coordinate = coodinates
        aroundMeMap.addAnnotation(point)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        aroundMeMap.setRegion(coordinateRegion, animated: true)
    }
    
    func addPointAnnotation(coodinates: CLLocationCoordinate2D, customer: String){
        var point = MKPointAnnotation()
        
        point.coordinate = coodinates
        point.title = customer
        aroundMeMap.addAnnotation(point)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if(annotation is MKUserLocation){
            return nil
        }
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier("AddressPinView")
        
        pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "AddressPinView")
        let image = UIImage(named: "default.jpg")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRectMake(0, 0, 30, 30)
        pinView!.leftCalloutAccessoryView = imageView
        
        // 點擊時是否出現註解
        pinView!.canShowCallout = true
        return pinView
    }
    
    func loadingAroundMeMap()
    {
        
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            
            let currentLocation = appDelegate.currentLocation
            let userLocation = CLLocation(latitude: (currentLocation?.latitude)!, longitude: (currentLocation?.longitude)!)
            centerMapOnLocation(userLocation)
        }
        
        for customer in customerList!{
            customerModel.locateCustomerAddressHandler(customer.getCustomerAddress()){
                (location) in
                self.addPointAnnotation(location!, customer: customer.getCustomerName())
            }
        }
        
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
