##AlamoFire

+ [AlamoFire Github](https://github.com/Alamofire/Alamofire)	

AlamoFire is a popular http networking library for iOS. Simply put it's a way for use to send or receive information over the internet. A  basic request could looks something like this: 
```
Alamofire.request(.GET, "http://somewebsite.com", parameters: ["foo": "bar"])
         .response { request, response, data, error in
             print(request)
             print(response)
             print(data)
             print(error)
          }
```

We specify that it's a `.GET` request (which should look familiar to you from php), the url it's going to, and optionally some parameters, Again, the concept of parameters should be easy for you to understand from when we were handling forms with php.

We then handle the response in something called a `closure`. Closures are used a lot in Swift, and the syntax can be a little confusing at first. But really all a closure is is a block of code just like any other function. It can take parameters, just like a function, the only difference is that here it isn.t given a name, it's just a code block. The example above has four parameters coming in; request, response, data, and error.

####Sending Parameters

```
let parameters = [
                "lat": //latitude coordinate,
                "lon": //longatude coordinate,
                "units": "metric",
                "appid": "bc620920461d6ff26e97805183bf8fdd"]
```

####Asynchronous vs Synchronous

AlamoFire requests are done **Asynchronously**.

####None https network requests

With the introduction of iOS9 Apple decided that by default none https network requests were not allowed. You can enable it by adding the following key to your `info.plist` file. The easiest way to do this is right click on the plist file and choose "Open as > Source Code"

```
<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
	</dict>
```

**Add the new key just inside the last two </dict> and </plist> tags of the file.**
