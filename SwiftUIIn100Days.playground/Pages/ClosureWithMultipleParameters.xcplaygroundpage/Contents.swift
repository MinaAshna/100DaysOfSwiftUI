//: [Previous](@previous)

import Foundation

func travel(action: (String, Int) -> String) {
    print("I am ready to go")
    let description = action("Copenhagen", 50)
    print(description)
    print("Voila")
}

travel {
    "I am driving my car in \($0) at \($1) km/h"
}
//: [Next](@next)
