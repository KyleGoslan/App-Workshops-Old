##Setting Regions

The way we can get notified of a device entering or leaving a location is by setting up "regions" in the form of `CLCircularRegion` objects. When we create a region we need to provide three pieces of info. 

+ Center: A `CLLocationCoordinate2D` lat/lng of the point. 
+ Radius: How far from that point the notification kicks in (meters).
+ Identifier: This is a `String` and is a name for our reference. 

We need to set up a `CLLocationManager` object and set the delegate just like we've done in the past when dealing with users location. So you need a instance property for it, just like we've always done:

```swift 
let locationManager = CLLocationManager()
```

Then in our `viewDidLoad` method we'll request authorisation and set the delegate, same as aways. 

```swift
locationManager.requestAlwaysAuthorization()
locationManager.delegate = self
```

We now need to set up our `CLCircularRegion` object (so we also need a location to use).

```swift
let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
let boscomePierRegion = CLCircularRegion(center: boscombePier, radius: 100, identifier: "Boscome Pier")
```

Once we have our region we can ask our `locationManager` to start monitoring for it like this:

```swift
locationManager.startMonitoringForRegion(boscomePierRegion)
```

The default setting is that we'll get notified on both enter and exit movements for that region. We can change that by setting the following properties to false, this will obviously depend on what you need to be notified of for your application. If we set both to false, we would never receive any notification. 

```swift
bournemouthPierRegion.notifyOnEntry = false
bournemouthPierRegion.notifyOnExit = false
```

Lastly we need to implement some of the delegate methods for the `CLLocationManager` object.

```swift 
extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Leaving \(region.identifier)")
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entering \(region.identifier)")
    }
   
}
```





