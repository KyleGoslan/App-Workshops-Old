##Placemarks

A `CLPlacemark` contains a bunch on information related to location on the world map. We can create them manually, but most of the time you'll be dealing with ones that are generated for you in response to a geocoding request. 

**Apple Docs:** "Placemark data includes information such as the country, state, city, and street address associated with the specified coordinate. It can also include points of interest and geographically related data."

####Dealing With Oceans

Sometimes the location you'll geocode might not be on land, so things like country, or postal code might be `nil`. The `CLPlacemark` object has two properties that can help us deal with this: 

+ `ocean`: The name of the ocean associated with the placemark.
+ `inlandWater`: The name of the inland water body associated with the placemark.

As an example of how you might want to deal with this, you might do:

```swift 
if let ocean = placemark.ocean {
    print(ocean)
} 
```

