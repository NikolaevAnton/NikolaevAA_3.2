//
//  ContentView.swift
//  NikolaevAA_3.2
//
//  Created by Anton Nikolaev on 24.01.2022.
//

import SwiftUI

struct ContentView: View {
    

    @FocusState private var rgbActiveValue: ColorPresent.RGB?
    
    @State private var red = ColorPresent(rgb: .red, valueDouble: 100.0, value: "100")
    @State private var green = ColorPresent(rgb: .green, valueDouble: 100.0, value: "100")
    @State private var blue = ColorPresent(rgb: .blue, valueDouble: 100.0, value: "100")
    
    @State private var redText = "100"
    @State private var greenText = "100"
    @State private var blueText = "100"
    
    
    private func textFieldReadValue() {

        if rgbActiveValue == .red {
            red.value = redText
            if let valueInt = Int(red.value), valueInt > -1 && valueInt < 256 {
                red.valueDouble = Double(valueInt)
            } else {
                redText = "\(Int(red.valueDouble))"
            }
        }
        
        if rgbActiveValue == .green {
            green.value = greenText
            if let valueInt = Int(green.value), valueInt > -1 && valueInt < 256 {
                green.valueDouble = Double(valueInt)
            } else {
                greenText = "\(Int(green.valueDouble))"
            }
        }
        
        if rgbActiveValue == .blue {
            blue.value = blueText
            if let valueInt = Int(blue.value), valueInt > -1 && valueInt < 256 {
                blue.valueDouble = Double(valueInt)
            } else {
                blueText = "\(Int(blue.valueDouble))"
            }
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
