//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mihai Leonte on 11/11/2019.
//  Copyright © 2019 Mihai Leonte. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var order = Orders()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.item.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper(value: $order.item.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.item.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.item.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.item.specialRequestEnabled {
                        Toggle(isOn: $order.item.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.item.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
