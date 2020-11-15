//
//  ImplicitAnimation.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/12/20.
//

import SwiftUI

struct ImplicitAnimation: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap me") {
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(Color.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .animation(.default)
    }
}

struct ImplicitAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimation()
    }
}
