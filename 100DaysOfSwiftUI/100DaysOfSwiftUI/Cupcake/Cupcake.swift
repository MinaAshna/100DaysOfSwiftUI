//
//  Cupcake.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 03/12/2020.
//

import SwiftUI

struct Cupcake: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your Cupcake", selection: $order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 0...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                     Text("Any special requests?")
                    }
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(
                        destination: AddressView(order: order)) {
                            Text("Delivery details")
                        }
                }
            }
            .navigationTitle("Cupcake corner")
        }
    }
}

struct Cupcake_Previews: PreviewProvider {
    static var previews: some View {
        Cupcake()
    }
}
