//: [Previous](@previous)

import Foundation

func travel(action: (String) -> Void) {
    print("I am ready to go")
    action("Copenhagen")
    print("Voila")
}

let driving = { (place: String) in
    print("I am driving my car in \(place)")
}

travel(action: driving)

//: [Next](@next)
