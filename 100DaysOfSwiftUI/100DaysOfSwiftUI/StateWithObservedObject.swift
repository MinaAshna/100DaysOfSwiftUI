//
//  ObservedObject.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/15/20.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct StateWithObservedObject: View {
    @ObservedObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("Firstname", text: $user.firstName)
            TextField("Lastname", text: $user.lastName)
        }
    }
}

struct ObservedObject_Previews: PreviewProvider {
    static var previews: some View {
        StateWithObservedObject()
    }
}
