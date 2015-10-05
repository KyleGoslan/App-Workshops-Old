## Protocols & Delegates

Protocols and delegates allow objects to do things on belahalf (or in response) of other objects. In most simple cases you'll probably want your view controller to handle delegate methods of other objects you create (like the `Person` object we created in the workshop, or the `UITextField` object from our storyboard). 

___

####Setting Up The Object
Firstly you need to design the protocol for your object. The protocol is the first part of the "contract" here you define the methods the delegate will perform on behalf of the object in question (in our example the `Person` object). It will look something like this:

```swift
protocol PersonDelegate {
    func personHadBirthday()
}
```
It starts with the keyword `protocol` followed by the name (usually the objects/class name appended with "Delegate"). Then a list of methods. The only difference here is that we don't write the method body, just the name and set of brackets. A protocol can have any number of methods depending on our needs. 

Next we set up a property on the object to store a reference to its delegate (marked as an optional with the question mark), something like:

```swift
var delegate: PersonDelegate?
```
Finally, whenever we want the delegate to perform something we call the method. In this case it would be:

```swift
delegate?.personHadBirthday()
```

This is all thats needed in the object class itself.
___

####Handling The Delegate Method
Back in our view controller class we can change the opening line of the class deffinition to this:

```swift
class ViewController: UIViewController, PersonDelegate {
```
This simply lets the class know that it is going to implement the delegate methods we defined in the `Person` class protocol.

Note: At this point you can expect to see an error: "Type 'ViewController' does not conform to protocol 'PersonDelegate'". This is simply saying that the `ViewContoller` class hasn't implemented the `personHadBirthday()` function. So somewhere in your view controller calss, we need to do so:

```swift 
func personHadBirthday() {
}
```
From now on, when we create objects, we can set its delegate just like any other property. So in the case of our person class it might look somethign like this:

```swift 
var me = Person(name: "Kyle", age: 20)
me.delegate = self
```
Creating a variable of the object is no different to before, we then set its delegat property (in this case) to self. Meaning that this view controller is now in the objects delegate. 










