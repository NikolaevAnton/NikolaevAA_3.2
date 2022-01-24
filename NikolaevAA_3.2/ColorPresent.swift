//
//  ColorPresent.swift
//  NikolaevAA_3.2
//
//  Created by Anton Nikolaev on 25.01.2022.
//

import Foundation

struct ColorPresent {
    
    enum RGB: String, Hashable {
        case red = "red"
        case green = "green"
        case blue = "blue"
    }
    
    let rgb: RGB
    
    var valueDouble: Double
    var value: String
    /*
    var value: String {
        get {
            return "\(Int(valueDouble))"
        }
        set {
            if let valueInt = Int(newValue), valueInt > -1 && valueInt < 256 {
                self.value = newValue
                self.valueDouble = Double(valueInt)
            }
        }
    }
     */
}
