//
//  ContentView.swift
//  Conversion of temperature
//
//  Created by Adam Gerber on 10/23/22.
//

//Converting from celsius to fahrenheit
// variables: input celsius temp,
// methods: temperature conversion



import SwiftUI

struct ContentView: View {
    
    @FocusState private var inputIsFocused: Bool
    
    @State private var input = 20.5
    @State private var selectedInput = "Celsius"
    @State private var selectedOutput = "Fahrenheit"
    
    let temperaturesInput = ["Celsius", "Fahrenheit", "Kelvin"]
    let temperaturesOutput = ["Celsius", "Fahrenheit", "Kelvin"]
    
    func tempConverter() -> Double {
        var output: Double
        if selectedInput == "Celsius" && selectedOutput == "Fahrenheit" {
            output = (input * 9/5) + 32
            return output
        } else if selectedInput == "Celsius" && selectedOutput == "Kelvin" {
            output = (input + 273.15)
            return output
        } else if selectedInput == "Fahrenheit" && selectedOutput == "Celsius" {
            output = (input - 32) * 5/9
            return output
        } else if selectedInput == "Fahrenheit" && selectedOutput == "Kelvin" {
            output = (input - 32) * 5/9 + 273.15
            return output
        } else if selectedInput == "Kelvin" && selectedOutput == "Celsius" {
            output = (input - 273.15)
            return output
        } else if selectedInput == "Kelvin" && selectedOutput == "Fahrenheit" {
            output = (input - 273.15) * 9/5 + 32
            return output
        } else {
            return input
        }
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    Picker("Select Unit", selection: $selectedInput){
                        ForEach(temperaturesInput, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose your temperature unit")
                }
                
                Section {
                    TextField("Enter temperature", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Temperature in \(selectedInput)")
                }
                
                Section {
                    Picker("Select unit to convert to", selection: $selectedOutput){
                        ForEach(temperaturesOutput, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose your conversion unit")
                }
                
                Section {
                    Text(tempConverter(), format: .number)
                } header: {
                    Text("Temperature in \(selectedOutput)")
                }
            }
            .navigationTitle("Conversions")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
