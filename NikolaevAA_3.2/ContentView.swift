//
//  ContentView.swift
//  NikolaevAA_3.2
//
//  Created by Anton Nikolaev on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
    

    @FocusState private var rgbActiveValue: ColorPresent.RGB?
    
    @State private var red = ColorPresent(valueDouble: 100.0, value: "100")
    @State private var green = ColorPresent(valueDouble: 100.0, value: "100")
    @State private var blue = ColorPresent(valueDouble: 100.0, value: "100")
    
    @State private var redText = "100"
    @State private var greenText = "100"
    @State private var blueText = "100"
    
    private func setValue(currentColor: ColorPresent.RGB, currentValue: String) {
        if let valueInt = Int(currentValue), valueInt > -1 && valueInt < 256 {
            switch currentColor {
            case .red:
                red.valueDouble = Double(valueInt)
            case .green:
                green.valueDouble = Double(valueInt)
            case .blue:
                blue.valueDouble = Double(valueInt)
            }
        } else {
            redText = "\(Int(red.valueDouble))"
            greenText = "\(Int(green.valueDouble))"
            blueText = "\(Int(blue.valueDouble))"
        }
    }
    
    
    private func textFieldReadValue() {
        
        if rgbActiveValue == .red {
            setValue(currentColor: .red, currentValue: redText)
        }
        
        if rgbActiveValue == .green {
            setValue(currentColor: .green, currentValue: greenText)
        }
        
        if rgbActiveValue == .blue {
            setValue(currentColor: .blue, currentValue: blueText)
        }

        
        rgbActiveValue = nil
        
    }
    
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.7)
                .ignoresSafeArea()
            
            VStack {
                ChangeColorView(
                    color: Color(
                        red: red.valueDouble / 255,
                        green: green.valueDouble / 255,
                        blue: blue.valueDouble / 255))
                VStack {
                    SettingColorView(rgbValue: $red.valueDouble, valueInTextVield: $redText, color: .red)
                        .focused($rgbActiveValue, equals: .red)
                    SettingColorView(rgbValue: $green.valueDouble, valueInTextVield: $greenText, color: .green)
                        .focused($rgbActiveValue, equals: .green)
                    SettingColorView(rgbValue: $blue.valueDouble, valueInTextVield: $blueText, color: .blue)
                        .focused($rgbActiveValue, equals: .blue)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard){
                        Button(action: textFieldReadValue) {
                            Text("Done")
                        }
                    }
                }
                Spacer()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
