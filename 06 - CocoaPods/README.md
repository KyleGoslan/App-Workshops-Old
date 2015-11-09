##CocoaPods

####Contents
+ [CocoaPods](https://github.com/KyleGoslan/App-Workshops/blob/master/06%20-%20CocoaPods/CocoaPods.md)	
+ [AlamoFire](https://github.com/KyleGoslan/App-Workshops/blob/master/06%20-%20CocoaPods/AlamoFire.md)

####Workshop Objectives
+ Introduce the concept of dependancies. 
+ Introduce how to use CocoaPods. 
+ Learn how to make network request. 
+ Turn JSON data into usable swift objects. 
 

####Summary
So far we've been using the core libraries and frameworks Apple provides. It's possible to do almost anything we need with these alone, but sometimes it can be a little more work than we'd like. This is where third party libraries come in. These are libraries that make it easier for us to do specific things. For example, so far we've (fairly extensively) used the `CoreLocation` library to make it easier to do things with location data. It would be possible to do this without these libraries, but we'd have to do **a lot** of (boring) work ourselves to get to the point where we could actually do what we set out to. 

Third party libraries exist for the exact same reason. They give us the ability to do thing a little easier than it would be to do without them. We're going to be pulling down some data from the web and using the information in our apps. We're going to take a look at how we can install and use a few popular third party libraries to make our lives a little easier, namely:

+ AlamoFire - To make network requests.	
+ SwiftyJson - To parse the JSON data. 

We'll be installing the libraries through CocoaPods. This is a dependancy manger for Xcode, so we'll also briefly discuss what a dependancy manger is and why they're useful. 

