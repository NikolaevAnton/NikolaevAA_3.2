//
//  ChangeColorView.swift
//  NikolaevAA_3.2
//
//  Created by Anton Nikolaev on 24.01.2022.
//

import SwiftUI

struct ChangeColorView: View {
    
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 300, height: 170)
            .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 4))
            .foregroundColor(color)
            
    }
}

struct ChangeColorView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeColorView(color: .blue)
    }
}
