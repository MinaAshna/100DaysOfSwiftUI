//: [Previous](@previous)

import Foundation

class Singer {
    var name = "Taylor"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Swift"
print(singerCopy.name)
print(singer.name)

//: [Next](@next)
