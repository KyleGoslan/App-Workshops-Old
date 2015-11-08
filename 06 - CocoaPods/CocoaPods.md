##What is a dependancy manager?
As projects grow you might want to use third party libraries to handle tasks more efficiently. You may even make changes that mean you no longer require a library that you once did. It would be time consuming to manually add and remove these to our projects. This is the point of a dependancy manager. We can **manage** all the required third party libraries in one place. When we're done listing the libraries that we want to use, we ask the dependancy manager to do and get them on our behalf. 

It'll download and include (or remove) them in our project as needed. 

####CocoaPods
The dependancy manager for Xcode is called CocoPods. It's incredibly simple to use, and give us access to thousands of independently developed libraries. 

####Installing CocoaPods
**Note: CocoaPods is already installed in the labs**

CocoaPods is build on ruby, which is installed by default on OS X machines. To install the CocoaPod "gem", you can ope up terminal and run the command:

```
$ sudo gem install cocoapods
``` 

At which point you'll be prompted for your system password. Done!

+ [CocoaPods Getting Started Guide](https://guides.cocoapods.org/using/getting-started.html)	

####Using Pods

Using libraries via CocoaPods is also incredibly straight forward, it takes just a few steps to get up and running. In a terminal window, navigate to your projects directory and run the command:

```
pod init 
```

In that directory you'll now see a new "Podfile" file has been created. Open that file in a text editor **(not notepad though)**. There will be four lines at the top of your file, two are just notes, but all four are commented out. You can remove the notes and uncomment out the other lines so it looks like this:

```
platform :ios, '8.0'
use_frameworks!
```

Following that,

You'll have something like this, where 'YOUR PROJECT' is whatever your project is called: 

```
target 'YOUR PROJECT' do

end
```

In-between these lines is where we list the libraries that we want to use, for example:

```
target 'YOUR PROJECT' do
	pod 'Alamofire'
	pod 'SwiftyJSON'
end
```

Save that file, and back in terminal (still in your projects directory) run the command:

```
pod install
```

You'll see some output in the terminal window about the libraries being installed more importantly pay attention to the line **"Please close any current Xcode sessions and use YOUR PROJECT.xcworkspace for this project from now on."**

You'll notice in your project directory there is now a `.xcworkspace` file (the white icon). **This is the project file you use from now on**.









