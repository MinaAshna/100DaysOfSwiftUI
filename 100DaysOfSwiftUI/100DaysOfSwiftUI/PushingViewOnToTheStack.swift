//
//  PushingViewOnToTheStack.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 16/11/2020.
//

import SwiftUI

struct PushingViewOnToTheStack: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Details \(row)")) {
                    Text("Row (\(row))")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct PushingViewOnToTheStack_Previews: PreviewProvider {
    static var previews: some View {
        PushingViewOnToTheStack()
    }
}
