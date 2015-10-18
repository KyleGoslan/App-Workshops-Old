##Permission

Reading device location is straight forward. But before we can start just taking peoples locations as we please, we do need to notify the user that we would like to do so and give them the opportunity to deny us access to this information. 

Luckily this is fairly straight forward our part. We need to make a small addition to our applications `info.plist` file. You'll find this file in the project navigator where your other files are. This is an XML file that contains some information about our app. 

We need to add a key to this file. The easiest way to do this is right click somewhere in the empty space in the bottom of the file and select "add row". We have one of two options for the first field:

+ NSLocationWhenInUseUsageDescription	
+ NSLocationAlwaysUsageDescription	

The first is if we only need to be using the location data when our application is active, the second is if we want to always have access to it, even when the application is running in the background. 

In the right had column you can put whatever you want. This is a message that will be displayed to the user when our application asked for permission use location data.

**Note** 
The permission alert is only shown the first time a location request is made. Users can then manage this on a per app basis in their phones settings. 


