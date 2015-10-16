//
//  ViewController.swift
//  Demo
//
//  Created by Kyle Goslan on 11/10/2015.
//  Copyright © 2015 Kyle Goslan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    var lat:Float = 0.0
    var long:Float = 0.0
    
    var geocoder = CLGeocoder()

    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        latLabel.text = "\(lat)"
        longLabel.text = "\(long)"
    }
    
    @IBAction func latSlider(sender: UISlider) {
        lat = sender.value
        latLabel.text = "\(lat)"
    }
    
    @IBAction func longSlider(sender: UISlider) {
        long = sender.value
        longLabel.text = "\(long)"
    }

    @IBAction func getAddress(sender: UIButton) {
        let location = CLLocation(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        mapView.setCenterCoordinate(CLLocationCoordinate2DMake(CLLocationDegrees(lat), CLLocationDegrees(long)), animated: true)
        reverseGeocode(location)

        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)
    }
    
    func reverseGeocode(location: CLLocation) {
        if !geocoder.geocoding {
            geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                if placemarks!.count > 0 {
                    if let placemark = placemarks!.first {
                        
                        var annotationTitle = ""
                        
                        if let ocean = placemark.ocean {
                            annotationTitle = ocean
                        } else {
                            annotationTitle = placemark.country!
                        }
                    
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(self.lat), CLLocationDegrees(self.long))
                        annotation.title = annotationTitle
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
