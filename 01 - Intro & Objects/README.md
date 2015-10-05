##Into To Swift

####Types Variables & Constants

Variables are created with the the keyword var. You then assign them a name and a value.

```swift
var name = "Jon"
var age = 10
```

Swift uses ‘Type Inference’ to infer what type of object a variable is. The example below is is exactly the same as above, only here we’re stating the exact type of. When the type is obvious (i.e. it’s obvious “Jon” is a string and 10 is an int) we don't have to do this and the above example is preferred.

```swift
var name: String = "Jon"
var age: Int = 10
```

**Tip**: Whenever you see a semicolon, read it as “is of type”.  You’ll see this when working with optionals and passing values into methods. So the example above would read as “The variable name is of type string and is equal to Jon”. 

We can replace the keyword var with let to make something a constant. They we then use them the same way as variable, only a constant (as the name implies) cannot be changed once it is set. 

___

####Functions/Methods

Functions work similarly to what we’ve seen in the past. They are named blocks of code that we can call over and over to perform a task. They are declared with the word func the name we want to give the function, a set of brackets and then a set of curly braces which contains whatever we want to function to do. A simple function looks like this. 

```swift
func sayHello() {
    print("hello")
}
```

To call a function we simply type its name followed by a set of brackets.

```swift
sayHello()
```

We can add flexibility to our functions by allowing them to take arguments (or parameters) and using them inside our functions.  This function now accepts an argument of “name” which is of type String. All this means is that when we call this function its expecting a String to be passed to it which it can use, and it will be called name.

```swift
func sayHello(name: String) {
    print("hello my name is \(name)")
}
```

**Note**: I’m using string interpolation to use the name value within a String.

The call to the function would now look something like this.

sayHello("Jon")

**Note**: “Functions” and “Methods” are (for all intensive purposes) are the same thing. The difference being that a function becomes a method when it is contained within a class. They are written and perform in exactly the same way. 







