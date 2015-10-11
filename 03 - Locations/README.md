##Locations

####Contents
+ [Reverse Geocoding]()	
+ [Placemarks]()  
+ [Task]()  

####Workshop Objectives
+ Introduction to `CLLocation`, `CLGeocoder` and `CLPlacemark` objects.	
+ Converting lat/long coordinates to address. 
+ Basic integration with map views. 	

####Summary
This will be an introduction to some of the classes/objects that can help us work with location based information in iOS. When dealing with location on modern devices we usually get location information back in the form of latitude and longitude values (lat/long for short). For example, the location of Weymouth House is 50.742766, -1.894778 (you can find lat/long for any location by clicking somewhere on Google Maps). 

Unfortunately these coordinates usually don't mean a lot to most of us. To make it more useful we need to convert these values into something like an address. This process is called "reverse geocoding" (converting the other way is just "geocoding"). Being a common task, Apple makes this fairly easy for us to do, and in return hopefully we get back a `CLPlacemark` object. This object contains properties for things we would usually associate with an address area, postcode, street name etc.



