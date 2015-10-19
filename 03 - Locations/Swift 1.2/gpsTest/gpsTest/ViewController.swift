//
//  ViewController.swift
//  gpsTest
//
//  Created by Abigail Norris (i7696586) on 12/10/2015.
//  Copyright (c) 2015 Abigail Norris (i7696586). All rights reserved.
//

import UIKit
import CoreLocation
//To start using location
import MapKit
//use map


class ViewController: UIViewController {
    
    var lat:Float = 0.0
    var long:Float = 0.0
    
    //Two properties in your view controller to store the values from the sliders
    //The value we get out of our slider is a float, so we need our properties to be the same.
    
    var geocoder = CLGeocoder()
    //The CLGeocoder class provides services for converting between a coordinate (specified as a latitude and longitude) and the user-friendly representation of that coordinate. A user-friendly representation of the coordinate typically consists of the street, city, state, and country information corresponding to the given location
    //This is linked to the button which will display what country the slider is in below in outpul. (.Nill is an ocean)
    
    
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    
    //connected the label lat and long to referecning outlet and set as action and then sender for both lat and long
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewDidLoad is called after your view is loaded.
    }
    
    
    @IBAction func latSlider(sender: UISlider) {
        lat = sender.value
        latLabel.text = "\(lat)"
    }
    // connect the lat and long slider as a 'sent event - value changed' in the story board because its a float/ variable.
    //this then gives the slider a value when its moved
    
    
    @IBAction func longSlider(sender: UISlider) {
        long = sender.value
        longLabel.text = "\(long)"
    }
    
    //same as above
    
    
    @IBAction func goButton(sender: AnyObject) {
        let location = CLLocation(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        reverseGeocode(location)
    //IBAction for the button
    //The first line is creating a CLLocation object. Most simply, this is just an object that contains both our longitude and latitude values. We then call our own custom reverseGeocode() function and pass it then location constant that we just created.
        //IBAction and IBOutlet are macros defined to denote variables and methods that can be referred to in Interface Builder.
        myMap.setCenterCoordinate(CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long)), animated: true)
        
        let annotations = myMap.annotations
        myMap.removeAnnotations(annotations)
        // get annotations and then remove - red pins
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(lat), CLLocationDegrees(long))
        //want location to be on map
        annotation.title = "Hey!"
        myMap.addAnnotation(annotation)
        myMap.selectAnnotation(annotation, animated: true)
        //default displaying automatically
        
    }
    
    // reverseGeocode function looks like this:
    
    func reverseGeocode(location: CLLocation) {
        if !geocoder.geocoding  {
            // boolan value above
            geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                if placemarks!.count > 0 {
                    if let placemark = placemarks!.first as? CLPlacemark {
                        print(placemark.country)
                    }
                } else {
                    print("Problem with the data received from geocoder")
                }
            })
        } else {
            print("Geocoder is already geocoding")
            return
            //everything is running
        }
    }
    
}



