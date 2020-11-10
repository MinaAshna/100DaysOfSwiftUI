//: [Previous](@previous)

import Foundation

func travel(action: (String) -> String) {
    print("I am ready to go")
    let description = action("Copenhagen")
    print(description)
    print("Voila")
}

travel {
    "I am driving my car in \($0)"
}

//: [Next](@next)
