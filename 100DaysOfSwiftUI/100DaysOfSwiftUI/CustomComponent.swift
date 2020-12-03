//
//  CustomComponent.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 03/12/2020.
//

import SwiftUI

struct PushButton: View {
    var title: String
    @Binding var isOn: Bool
    
    var onColor = Color.green
    var offColor = Color.red
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(isOn ? onColor : offColor)
        .foregroundColor(Color.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 5 : 0)
    }
}

struct CustomComponent: View {
    @State private var remeberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $remeberMe)
            Text(remeberMe ? "On" : "Off")
        }
    }
}

struct CustomComponent_Previews: PreviewProvider {
    static var previews: some View {
        CustomComponent()
    }
}
