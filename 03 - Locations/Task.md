##Task

####Setup The UI
First drag out two sliders and two labels onto your storyboard, One pair for each latitude and longitude. 

![image](https://raw.githubusercontent.com/KyleGoslan/App-Workshops/master/images/storyboard-sliders.png)

Latitude runs from -90 to 90. So select the slider and in attributes inspector, you can set the minimum and maximum values (I actually set mine to one less so -79 and 79). You can do exactly the same for the longitude slider, but -180 to 180 (again I did one less).

Were going to change the text of the labels to match the value of the slider, so we'll need to set up IBOutlets for each of them. Select your view controller in the storyboard and switch to the assistant editor (where we can see the storyboard and the code to go with it). Ctrl click and drag from your labels to create your outlets, something like below. 

```swift
@IBOutlet weak var latLabel: UILabel!
@IBOutlet weak var longLabel: UILabel!
```

Set up two properties in your view controller to store the values from the sliders. 

```swift
var lat:Float = 0.0
var long:Float = 0.0
```

Here we have to cast them as the type of `Float` as swift will default a decimal number to a `Double`. However the value we get out of our slider is a float, so we need our properties to be the same. I'm also giving them an initial value of 0. 

We need to get the values out of our sliders, so set up IBActions for each of them. Make sure you set the arguments to sender. I set the relevant property that we just set up to the value from the slider, and then use string interpolation to set the labels text value to that value. This is for my latitude slider, you should be able to figure out the other one, which is virtually identical. 

![image](https://raw.githubusercontent.com/KyleGoslan/App-Workshops/master/images/connecting-sliders.png)

```swift
@IBAction func latSlider(sender: UISlider) {
    lat = sender.value
    latLabel.text = "\(lat)"
}
```

####Add A Button
Add a button to your storyboard. This is going to trigger the magic. So set up the IBAction for the button, it should look something like this:

```swift
let location = CLLocation(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
reverseGeocode(location)
```

The first line is creating a `CLLocation` object. Most simply, this is just an object that contains both our longitude and latitude values. We then call our own custom `reverseGeocode()` function and pass it then location constant that we just created. 


####Reverse Geocode Function
To start using location we need to import the Core Location library. At the top of your ViewController next to the UIKit import add the following:

```swift
import CoreLocation
``` 

Where you create your `lat` and `long` variables go and create a `CLGeocoder` object as well:

```swift
var geocoder = CLGeocoder()
```

The finished `reverseGeocode` function looks like this:

#####Swift 1.2 (Currently in labs)
```swift 
func reverseGeocode(location: CLLocation) {
    if !geocoder.geocoding {
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
    }
}
```

#####Swift 2.0
```swift 
func reverseGeocode(location: CLLocation) {
    if !geocoder.geocoding {
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
    }
}
```

At this point you should be able to move your sliders around and see the values represented in your labels. When you press your button, provided you've landed on a country you should see that country name output in your console. 


####Adding A Map

```swift
mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long)), animated: true)
```

```swift 
let annotation = MKPointAnnotation()
annotation.coordinate = CLLocationCoordinate2DMake(CLLocationDegrees(lat), CLLocationDegrees(long))
annotation.title = "Hey!"
mapView.addAnnotation(annotation)
mapView.selectAnnotation(annotation, animated: true)
```

