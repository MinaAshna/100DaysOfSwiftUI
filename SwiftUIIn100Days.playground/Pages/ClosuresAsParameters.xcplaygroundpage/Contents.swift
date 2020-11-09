//: [Previous](@previous)

import Foundation

let driving = {
    print("I am driving my car")
}

func travel(action: () -> Void) {
    print("I am ready to go")
    action()
    print("Voila")
}

travel(action: driving)

//: [Next](@next)
