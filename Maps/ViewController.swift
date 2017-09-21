//
//  ViewController.swift
//  Maps
//
//  Created by mohammad 141 on 9/13/17.
//  Copyright © 2017 mohammad 141. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    //Outlets
    @IBOutlet weak var map: MKMapView!
    

    //Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude: CLLocationDegrees = 37.555
        let longitude: CLLocationDegrees = 45.102778

        let latDelta: CLLocationDegrees = 0.05

        let lonDelta: CLLocationDegrees = 0.05

        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)

        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        

        map.setRegion(region, animated: true)
        
        //hard
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "My House"
        
        annotation.subtitle = "hehehhe"
        
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        
        let longPress = UITapGestureRecognizer(target: self, action: #selector(self.longPress(gestureRecognizer:)))
        
        
       // longPress.minimumPressDuration = 2
        
        map.addGestureRecognizer(longPress)
        
    }
    
    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        annotation.title = "Customm"
        annotation.subtitle = "New"
        
        map.addAnnotation(annotation)
        
        
    }

    


}

