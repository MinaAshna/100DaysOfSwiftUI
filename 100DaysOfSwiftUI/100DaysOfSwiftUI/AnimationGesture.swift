//
//  AnimationGesture.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 11/14/20.
//

import SwiftUI

struct AnimationGesture: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { self.dragAmount = $0.translation }
                    .onEnded { _ in self.dragAmount = .zero }
            )
            .animation(.spring())
    }
}

struct AnimationGesture_Previews: PreviewProvider {
    static var previews: some View {
        AnimationGesture()
    }
}
