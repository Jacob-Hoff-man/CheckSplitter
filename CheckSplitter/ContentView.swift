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
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var totalBill: Double {
        let billAmount = Double(billValue) ?? 0
        let tip = billAmount / 100 * Double(tipPercentages[tipPercentage])
        return billAmount + tip
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 1
        return totalBill / peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Bill Amount and Number of People")) {
                    TextField("Bill Amount:", text: $billValue)
                        .keyboardType(UIKeyboardType.decimalPad)
                    
                    TextField("Number of People:", text: $numberOfPeople)
                        .keyboardType(UIKeyboardType.asciiCapableNumberPad)
                    
                }
                
                Section(header: Text("Select Tip Percentage")) {
                    Picker("Tip Percentage:", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total bill")) {
                    Text("$\(totalBill, specifier: "%.2f")")
                }
                
                Section(header: Text("Total Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            }
            .foregroundColor(Color.green)
            .navigationBarTitle("Bill Splitter", displayMode: .inline)
            .padding()
        }
        .colorScheme(ColorScheme.dark)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
