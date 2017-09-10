//
//  ViewController.swift
//  Finding the user location
//
//  Created by Mahmudur Rahman on 9/9/17.
//  Copyright © 2017 Code Mask. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var locationmanger = CLLocationManager()
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationmanger.delegate = self
        locationmanger.desiredAccuracy = kCLLocationAccuracyBest
        locationmanger.requestWhenInUseAuthorization()
        locationmanger.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userlocation: CLLocation = locations[0]
        let latitude = userlocation.coordinate.latitude
        let longitude = userlocation.coordinate.longitude
        
        let delta = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "My Location"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
    }

}

