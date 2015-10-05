import UIKit

class ViewController: UIViewController, PersonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let me = Person(name: "Jon", age: 10)
        me.delegate = self
        me.haveBirthday()
        
    }
    
    func birthdayCompleted() {
        print("Someone had a birthday")
    }

}