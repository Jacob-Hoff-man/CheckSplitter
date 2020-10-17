//
//  ContentView.swift
//  CheckSplitter
//
//  Created by Jacob on 10/16/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var billValue = ""
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let billAmount = Double(billValue) ?? 0
        let peopleCount = Double(numberOfPeople + 1)
        let tip = billAmount / 100 * Double(tipPercentages[tipPercentage])
        let total = billAmount + tip
        
        return total / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Bill Amount and Number of People")) {
                    TextField("Bill Amount:", text: $billValue)
                        .keyboardType(UIKeyboardType.decimalPad)
                    
                    Picker("Number of People:", selection: $numberOfPeople) {
                        ForEach(1 ..< 100) {
                            Text("\($0) People")
                        }
                    }
                    
                }
                
                Section(header: Text("Select Tip Percentage")) {
                    Picker("Tip Percentage:", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("Bill Splitter", displayMode: .inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
