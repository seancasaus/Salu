//
//  FlashCardViewController.swift
//  Salu
//
//  Created by Sean Casaus on 11/19/18.
//  Copyright © 2018 Sean Casaus. All rights reserved.
//

import UIKit
import MapKit

class FlashCardViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var mapType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CLGeocoder().geocodeAddressString("France", completionHandler:
            
            {(placemarks, error) in
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                    
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    
                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                    self.map.setRegion(region, animated: true)
                    let ani = MKPointAnnotation()
                    ani.coordinate = placemark.location!.coordinate
                    ani.title = placemark.locality
                    ani.subtitle = placemark.subLocality
                    self.map.addAnnotation(ani)
                }
        })

    }
    
    
//    @IBAction func showMap(_ sender: Any) {
//        //print("Inside Show Map Function");
//
//        switch(mapType.selectedSegmentIndex)
//        {
//        case 0:
//            map.mapType = MKMapType.standard
//        case 1:
//            map.mapType = MKMapType.satellite
//        default:
//            map.mapType = MKMapType.standard
//        }
//
//        // display the map
//        let region: MKCoordinateRegion = MKCoor
//        self.map.setRegion(region, animated: true)
//
//        // add an annotation
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = coordinates
//        annotation.title = titleView.text
//
//        self.map.addAnnotation(annotation)
//    }
}
