//
//  CustomModifiers.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 10/11/2020.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing, content: {
            content
                Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        })
    }
}

struct CustomModifiers: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .titleStyle()
        Color.blue
            .frame(width: 200, height: 200)
            .watermarked(with: "@minaashna")
    }
}

struct CustomModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiers()
    }
}
