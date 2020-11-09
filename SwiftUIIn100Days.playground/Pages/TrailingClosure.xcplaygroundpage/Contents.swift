//: [Previous](@previous)

import Foundation

func travel(action: () -> Void) {
    print("I am ready to go")
    action()
    print("Voila")
}

travel {
    print("I am driving my car")
}

//: [Next](@next)
