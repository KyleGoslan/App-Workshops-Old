//
//  ViewController.swift
//  tast
//
//  Created by Samuel Gray on 12/10/2015.
//  Copyright © 2015 Samuel Gray. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    var lat:Float = 0.0
    var long:Float = 0.0
    var geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        latLabel.text = "\(lat)"
        latLabel.text = "\(long)"
    }
    
    @IBAction func latSlider(sender: UISlider) {
        lat = sender.value
        latLabel.text = "\(lat)"
    }
    
    @IBAction func longSlider(sender: UISlider) {
        long = sender.value
        longLabel.text = "\(long)"
    }
    
    @IBAction func goButton(sender: UIButton) {
        let location = CLLocation(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        reverseGeocode(location)
        
        mapView.setCenterCoordinate(CLLocationCoordinate2DMake(CLLocationDegrees(lat), CLLocationDegrees(long)), animated: true)
        
    }
    
    func reverseGeocode(location: CLLocation) {
        if !geocoder.geocoding {
            geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                if placemarks!.count > 0 {
                    if let placemark = placemarks!.first as? CLPlacemark {
                        
                        let annotations = self.mapView.annotations
                        self.mapView.removeAnnotations(annotations)
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(self.lat), CLLocationDegrees(self.long))
                        annotation.title = placemark.country
                        self.mapView.addAnnotation(annotation)
                        self.mapView.selectAnnotation(annotation, animated: true)
                        
                    }
                } else {
                    print("Problem with the data received from geocoder")
                }
            })
        } else {
            print("Geocoder is already geocoding")
            return
        }
    }
    
}

