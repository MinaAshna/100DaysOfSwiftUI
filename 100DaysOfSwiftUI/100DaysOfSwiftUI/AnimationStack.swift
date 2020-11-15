//
//  AnimationStack.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/14/20.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(.default)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
