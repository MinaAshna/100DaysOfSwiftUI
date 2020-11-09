//: [Previous](@previous)

import Foundation

struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let person = Person(id: "minaashna")
person?.id.uppercased()

//: [Next](@next)
