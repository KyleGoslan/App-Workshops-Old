##Reverse Geocoding

Reverse geocoding is the fancy name given to taking lat/lng coordinates and turning them into something a user (or ourselves) will find more useful, like an address.

Being a common thing to need to do when dealing with locations, Apple provides a `CLGeocoder` object which can do this for us. All we need to do is provide this object with a location to turn into an address. We do this in the form of a `CLLocation`. In its simplest form, this is just an object that holds lat/lng values together. To create one, we could do this:

```swift
let location = CLLocation(latitude: 37.33233141, longitude: -122.0312186)
```

With we can now ask the `CLGeocoder` class to take our `location` constant and turn it into an address for us. First lets create a `CLGeocoder` object to work with:

```swift
let geocoder = CLGeocoder()
```

We can then call a method on it, and pass in the location we want geocoded as an argument. The method we want to call is this:

```swift
func reverseGeocodeLocation(location: CLLocation, completionHandler: CLGeocodeCompletionHandler)
```

It has a completion handler, formally known as a "closure" in Swift. In other languages it make be refereed to as a "callback". A closure is just a code block (like any other function) that gets performed after something happens. In this case the completion handler is performed once the server has responded with the information regarding our request. Hopefully the information containing an address, but if not, an error. The final method call for us will look like this: 

```swift
geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
	//Do whatever we need to do with either our placemarks or error. 
})
```
