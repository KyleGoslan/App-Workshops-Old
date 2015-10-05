import Foundation

protocol PersonDelegate {
    func birthdayCompleted()
}

class Person {
    
    var name: String
    var age: Int
    
    var delegate: PersonDelegate?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func haveBirthday() {
        age = age + 1
        delegate?.birthdayCompleted()
    }
    
}
