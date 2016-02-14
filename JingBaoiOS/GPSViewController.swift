//
//  GPSViewController.swift
//  JingBao
//
//  Created by 5BG on 2015/10/17.
//  Copyright © 2015年 Sunny. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GPSViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    var destination: Customer?
    var customerModel = CustomerModel()

    var mapView: MKMapView!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView()
        
        mapView.mapType = .Standard
        mapView.frame = view.frame
        mapView.delegate = self

        checkAuthForUserLocation()
        view.addSubview(mapView)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNavigation(stopByLocation: String){
            
            customerModel.locateCustomerAddressHandler(stopByLocation){
                (location) in
                 let request = MKDirectionsRequest()
                request.source = MKMapItem.mapItemForCurrentLocation()
                
                /* Convert the CoreLocation destination
                placemark to a MapKit placemark */
                
                let destinationCoordinates = location
                /* Get the placemark of the destination address */
                let destination = MKPlacemark(coordinate:
                    destinationCoordinates!,
                    addressDictionary: nil)
                
                request.destination = MKMapItem(placemark: destination)
                request.destination?.name = stopByLocation
                /* Set the transportation method to automobile */
                request.transportType = .Automobile
                
                /* Get the directions */
                let directions = MKDirections(request: request)
                directions.calculateDirectionsWithCompletionHandler{
                    response, error in
                    
                    guard let response = response else {
                        //handle the error here
                        return
                    }
                    
                    /* You can manually parse the response, but in
                    here we will take a shortcut and use the Maps app
                    to display our source and
                    destination. We didn't have to make this API call at all,
                    as we already had the map items before, but this is to
                    demonstrate that the directions response contains more
                    information than just the source and the destination. */
                    
                    /* Display the directions on the Maps app */
                    let launchOptions = [
                        MKLaunchOptionsDirectionsModeKey:
                        MKLaunchOptionsDirectionsModeDriving]
                    
                    MKMapItem.openMapsWithItems(
                        [response.source, response.destination],
                        launchOptions: launchOptions)
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
    
    func mapView(mapView: MKMapView,
        didFailToLocateUserWithError error: NSError) {
            displayAlertWithTitle("Failed",
                message: "Could not get the user's location")
    }
    
    /* Just a little method to help us display alert dialogs to the user */
    func displayAlertWithTitle(title: String, message: String){
        let controller = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        
        controller.addAction(UIAlertAction(title: "OK",
            style: .Default,
            handler: nil))
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    /* We will call this method when we are sure that the user has given
    us access to her location */
    func showUserLocationOnMapView(){
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .Follow
    }
    
    func checkAuthForUserLocation(){
        /* Are location services available on this device? */
        if CLLocationManager.locationServicesEnabled(){
            
            /* Do we have authorization to access location services? */
            switch CLLocationManager.authorizationStatus(){
            case .Denied:
                /* No */
                displayAlertWithTitle("Not Determined",
                    message: "Location services are not allowed for this app")
            case .NotDetermined:
                /* We don't know yet, we have to ask */
                locationManager = CLLocationManager()
                if let manager = self.locationManager{
                    manager.delegate = self
                    manager.requestWhenInUseAuthorization()
                }
            case .Restricted:
                /* Restrictions have been applied, we have no access
                to location services */
                displayAlertWithTitle("Restricted",
                    message: "Location services are not allowed for this app")
            default:
               
                startNavigation((destination?.getCustomerAddress())!)
            }
            
        } else {
            /* Location services are not enabled.
            Take appropriate action: for instance, prompt the
            user to enable the location services */
            print("Location services are not enabled")
        }
        
    }
 }
