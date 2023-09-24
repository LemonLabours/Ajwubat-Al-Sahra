//
//  WeSplitView.swift
//  Ajwubat-AlSahra
//
//  Created by Lama AL Yousef on 24/09/2023.
//

import SwiftUI

struct WeSplitView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 3
    @State private var tipPercentage = 20
    let tipPercentages = [10,15,20,25,0]

    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 1)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount/100 * tipSelection
        let grandValue = checkAmount + tipValue
        let amountPerPerson = grandValue / peopleCount
        return amountPerPerson
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.identifier )).keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(1..<11){
                            Text("people \($0)")
                        }
                    }
                }
                Section{
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0 , format: .percent)
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("how much tip do you want to leave?")
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: "SAR"))
                }
            }
            .navigationTitle("WeSplit")
        }

    }
}

#Preview {
    WeSplitView()
}
