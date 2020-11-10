//
//  ViewComposition.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 10/11/2020.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct ViewComposition: View {
    var body: some View {
        VStack {
            CapsuleText(text: "first")
                .foregroundColor(.white)
            CapsuleText(text: "second")
                .foregroundColor(.yellow)
        }
    }
}

struct ViewCompositions_Previews: PreviewProvider {
    static var previews: some View {
        ViewComposition()
    }
}



// custom modifier
