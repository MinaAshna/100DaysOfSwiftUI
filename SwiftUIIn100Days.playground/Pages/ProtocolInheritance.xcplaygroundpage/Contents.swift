//: [Previous](@previous)

import Foundation

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

class Person: Employee {
    func calculateWages() -> Int {
        return 1000000
    }
    
    func study() {
        
    }
    
    func takeVacation(days: Int) {
        
    }
}

//: [Next](@next)
