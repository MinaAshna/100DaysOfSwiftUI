//
//  TemperatureConversion.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 09/11/2020.
//

import SwiftUI
import Foundation

enum TemperatureUnits: Int, CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
    
    var title: String {
        switch self {
        case .celsius: return "celsius"
        case .fahrenheit: return "fahrenheit"
        case .kelvin: return "kelvin"
        }
    }
}

struct TemperatureConversion: View {
    @State private var inputUnit = TemperatureUnits.celsius.rawValue
    @State private var outputUnit = TemperatureUnits.fahrenheit.rawValue
    @State private var temperature = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the temperature to convert", text: $temperature)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose the temperature unit to convert from")) {
                    Picker("Select input unit", selection: $inputUnit) {
                        ForEach(0 ..< TemperatureUnits.allCases.count) {
                            Text("\(TemperatureUnits.allCases[$0].title)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Choose the temperature unit to convert to")) {
                    Picker("Select output unit", selection: $outputUnit) {
                        ForEach(0 ..< TemperatureUnits.allCases.count) {
                            Text("\(TemperatureUnits.allCases[$0].title)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Temperature in \(outputUnit) is")) {
                    Text("\(convertTemperature())")
                }
            }
            .navigationBarTitle("TemperatureConversion")
        }
    }
}

extension TemperatureConversion {
    private func convertTemperature() -> Double {
        let messurementFormatter = MeasurementFormatter()
        messurementFormatter.numberFormatter.maximumFractionDigits = 0
        messurementFormatter.unitOptions = .providedUnit
        
        let inputUnit = TemperatureUnits(rawValue: self.inputUnit) ?? TemperatureUnits.celsius
        let outputUnit = TemperatureUnits(rawValue: self.outputUnit) ?? TemperatureUnits.fahrenheit
        
        var celsiusTemperature = Double(temperature) ?? 0
        
        switch inputUnit {
        case .celsius:
            break
        case .fahrenheit:
            let input = Measurement(value: celsiusTemperature, unit: UnitTemperature.fahrenheit)
            let output = input.converted(to: .celsius)
            celsiusTemperature = output.value
        case .kelvin:
            let input = Measurement(value: celsiusTemperature, unit: UnitTemperature.kelvin)
            let output = input.converted(to: .celsius)
            celsiusTemperature = output.value
        }
        
        switch outputUnit {
        case .celsius:
            return celsiusTemperature
        case .fahrenheit:
            let input = Measurement(value: celsiusTemperature, unit: UnitTemperature.celsius)
            let output = input.converted(to: .fahrenheit)
            return output.value
        case .kelvin:
            let input = Measurement(value: celsiusTemperature, unit: UnitTemperature.celsius)
            let output = input.converted(to: .kelvin)
            return output.value
        }
    }
}

struct TemperatureConversion_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConversion()
    }
}
