##Getting A Location

Apple make it easy enough for us to get a location. Unsurprisingly, it's part of the `CoreLocation` library, so we need to import that. Up at the top of your file along with the other import statement add:

```swift
import CoreLocation 
```

When we looked at geocoding, we created a `CLGeocoder` object to handle all that stuff for us. Just like that we're going to create a `CLLocationManager` object that makes dealing with device location a whole lot easier. So first we're going to create a property for one, somewhere in your view controller (outside of any methods, usually near the top) add:

```swift
let locationManager = CLLocationManager()
```

Our `locationManager` object now needs to ask permission to use the devices location information. In the `viewDidLoad` method add: 

```swift 
locationManager.requestWhenInUseAuthorization()
```

**Note**
There is also a `requestAlwaysAuthorization()` method. Which one you use here will depend on the change you made to the info.plist file. Read the permission notes if you haven't already. 


`CLLoactionManager` objects have a bunch of delegate methods which allow us to handle updates to the location, so we need to set our `locationManager` objects delegate. under the line you previously added (in the `viewDidLoad` method) add:

```swift
locationManager.delegate = self
```

By setting the the delegate property to `self` it says we're going to handle the delegate methods for the object in this `ViewController` class. Next up we need to some of these delegate methods.

We're going to do it in a class extension at the bottom of our file. While this isn't essential (we could just as easily implement the methods in the main body of our class), this is a nice habit to get into. In a small example like this the benefit is negligible, but can make your classes a lot clearer in larger projects. 

At the bottom of the file (outside **everything**) add:

```swift 
extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
	    
	    let newLocation = locations.last
        
        if let newLocation = newLocation {
            print(newLocation)
        }
	
    }
    
}
```

This `locationManager...didUpdateLocations` method is whats called whenever our `CLLocationManager` object receives a new location update. It get an array of `CLLocation` objects (which we've used previously). Then were just pulling the last one out of the array, checking it's not `nil` with the `if let` syntax (optional chaining) and printing it out. 

Finally we just need to tell our `locationManager` instance to start sending the location updates to the delegate (in this case our view controller). Back up in the `viewDidLoad` method, right where you added the other lines, add: 

```swift
locationManager.startUpdatingLocation()
```

You should now get an output of locations to your log. 

