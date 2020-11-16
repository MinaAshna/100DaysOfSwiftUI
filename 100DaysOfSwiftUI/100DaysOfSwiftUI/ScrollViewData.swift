//
//  ScrollViewData.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 16/11/2020.
//

import SwiftUI

/*
 
 ScrollView creates all the instances at immediately (100 times in this case) where List acts lazy and create the instances of Text when needed.
 
 */

struct ScrollViewDataCustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Create a custom text")
        self.text = text
    }
}

struct ScrollViewData: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    ScrollViewDataCustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewData_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewData()
    }
}
