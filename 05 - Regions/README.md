##Regions

####Contents
+ [Simulating Custom Locations](https://github.com/KyleGoslan/App-Workshops/blob/master/05%20-%20Regions/Simulating%20Custom%20Locations.md)	
+ [Setting Regions](https://github.com/KyleGoslan/App-Workshops/blob/master/05%20-%20Regions/Setting%20Regions.md)	

####Workshop Objectives
+ See how we can simulate custom location/movement information. 
+ Set up regions. 
+ Get notified when a user enters or leaves a region. 

####Summary
So far we've seen how we can get location data, and a whole lot of other information (speed, accuracy etc) for a user. We also looked at calculating distance between two points (our location and a marker we put on the map). We could easily use this to work out this method to work out if a user is within a certain distance from somewhere. 

Fortunately `CLLocationManager` objects have similar functionality built in and ready to go. We can set up "regions" (`CLCircularRegion` objects) and be notified when a user enters or leaves this location.  