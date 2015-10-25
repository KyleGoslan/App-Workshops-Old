##Simulating Custom Locations

So far we've been using Xcode to simulate our locations from a list. 

![image](https://raw.githubusercontent.com/KyleGoslan/App-Workshops/master/images/choose-location.png)

In the simulation you can set a custom location if you go to Debug > Location > Custom Location...

![image](https://raw.githubusercontent.com/KyleGoslan/App-Workshops/master/images/set-location.png) 

However even this flexibility isn't going to be enough if we need to simulate movement which is what we're going to do. Luckily Xcode provides a relatively easy solution to this problem. We can provide it with a custom .gpx file full of location data to use. 

In this gpx file we can provide a list of "waypoints" for Xcode to simulate movement between. Each waypoint needs latitude and longitude information and optionally a name and timestamp. For example: 

```xml
<wpt lat="50.716098" lon="-1.875780">
    <name>Bournemouth Pier</name>
    <time>2014-09-24T14:55:33Z</time>
</wpt>
```

The name attribute is just a name associated with the point, in some cases you may want to pull this out to use it. The timestamp is more practical for what we're doing. Xcode will work out the time between the timestamps when simulating movement. You can leave it out and Xcode will just use a constant pace. 

The finished file might look something like this:

```xml 
<?xml version="1.0"?>
<gpx version="1.1" creator="Xcode">
    
    <wpt lat="50.719799" lon="-1.879439">
         <name>Gardens</name>
         <time>2014-09-24T14:55:30Z</time>
	</wpt>
    
    <wpt lat="50.716098" lon="-1.875780">
        <name>Bournemouth Pier</name>
        <time>2014-09-24T14:55:33Z</time>
    </wpt>
    
    <wpt lat="50.719914" lon="-1.843552">
        <name>Boscome Pier</name>
        <time>2014-09-24T14:55:36Z</time>
    </wpt>
    
</gpx>
```

This simulates movement from Bournemouth Gardens to Bournemouth Pier to Boscombe Pier. You can have as many of these waypoints as you like to simulate whatever you need during development.

Once you have this done you'll be able to choose it from the location simulator when you run your app. It will be called whatever you named your file.

![image](https://raw.githubusercontent.com/KyleGoslan/App-Workshops/master/images/custom-route.png) 




