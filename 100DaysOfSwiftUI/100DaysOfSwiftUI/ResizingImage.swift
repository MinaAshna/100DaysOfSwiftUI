//
//  ResizingImage.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 16/11/2020.
//

import SwiftUI

struct ResizingImage: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("Example")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width)
            }
        }
    }
}

struct ResizingImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizingImage()
    }
}
