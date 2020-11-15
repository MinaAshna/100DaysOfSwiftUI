//
//  ShowingAndHidingViews.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/15/20.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var name: String
    
    var body: some View {
        Button("Dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ShowingAndHidingViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name: "@minaashna")
        })
    }
}

struct ShowingAndHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingViews()
    }
}
