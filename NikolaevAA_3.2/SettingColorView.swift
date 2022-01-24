//
//  SettingColorView.swift
//  NikolaevAA_3.2
//
//  Created by Anton Nikolaev on 24.01.2022.
//

import SwiftUI

struct SettingColorView: View {
    @Binding var rgbValue: Double
    @Binding var valueInTextVield: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 20.0) {
            Text("\(Int(rgbValue))")
                .padding(.trailing, 20.0)
                .frame(width: 54.0)
            
            Slider(value: $rgbValue, in: 0...255, step: 1)
                .accentColor(color)
            TextField("", text: $valueInTextVield)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(width: 50.0, height: 40.0)
                       .overlay(
                           RoundedRectangle(cornerRadius: 5)
                               .stroke(Color.white, lineWidth: 1)
                       )
                       .background(Color.white)
        }.padding()
    }
}

struct SettingColorView_Previews: PreviewProvider {
    static var previews: some View {
        SettingColorView(rgbValue: .constant(100.0), valueInTextVield: .constant("100"), color: .red)
    }
}
