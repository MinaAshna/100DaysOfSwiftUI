//
//  ViewAndModifiers.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 10/11/2020.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func blueTitleStyle() -> some View {
        self.modifier(TitleModifier())
    }
}

struct ViewAndModifiers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .blueTitleStyle()
    }
}

struct ViewAndModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ViewAndModifiers()
    }
}
