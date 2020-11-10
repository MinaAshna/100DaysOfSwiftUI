//
//  BetterRest.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 10/11/2020.
//

import SwiftUI

struct BetterRest: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
            Text("\(sleepAmount, specifier: "%g") hours")
        }
    }
}

struct BetterRest_Previews: PreviewProvider {
    static var previews: some View {
        BetterRest()
    }
}
