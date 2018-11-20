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
    var defaultWord: String?
    var translatedWord: String?
    var targetLanguage: String?
    var languages = ["es" : "Spanish", "de" : "German", "fr" : "French", "pt" : "Portuguese", "it" : "Italian"]
    var locations = ["es" : "Mexico", "de" : "Germany", "fr" : "France", "pt" : "Brazil", "it" : "Italy"]
    var isFlipped: Bool = false
    var mapSwitch: Int = 0
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var mapType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        wordLabel.text = translatedWord
        languageLabel.text = languages[targetLanguage!]
        
        updateMap(location: locations[targetLanguage!]!)

    }
    
    @IBAction func FlipCard(_ sender: UIButton) {
        if isFlipped == false {
            wordLabel.text = defaultWord
            languageLabel.text = "English"
            self.view.backgroundColor = UIColor.purple
            updateMap(location: "United States")
            isFlipped = true
        } else {
            wordLabel.text = translatedWord
            languageLabel.text = languages[targetLanguage!]
            self.view.backgroundColor = UIColor.blue
            updateMap(location: locations[targetLanguage!]!)
            isFlipped = false
        }
    }
    
    func updateMap(location: String) {
        CLGeocoder().geocodeAddressString(location, completionHandler:
            
            {(placemarks, error) in
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                    
                } else if placemarks!.count > 0 {
                    
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    
                    let span = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
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
    
    @IBAction func changeMap(_ sender: UISegmentedControl) {
        if mapSwitch == 0 {
            self.map.mapType = MKMapType.satellite
            mapSwitch = 1
        } else {
            self.map.mapType = MKMapType.standard
            mapSwitch = 0
        }
    }
}
