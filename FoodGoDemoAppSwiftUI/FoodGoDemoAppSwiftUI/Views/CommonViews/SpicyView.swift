//
//  SpicyView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 06/03/25.
//

import SwiftUI

struct SpicyView: View {
    @Binding var spicyLevel: Double
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text("Spicy")
                    .font(.custom(CustomFont.poppinsMedium.rawValue, size: 18))
                Spacer()
            }
            Slider(value: self.$spicyLevel, in: 0...1)
                .accentColor(.themeRed)
                .shadow(color: .yellow.opacity(0.4), radius: 4, y: 4)
            
            HStack {
                Text("Mild").foregroundColor(.green)
                Spacer()
                Text("Hot").foregroundColor(.themeRed)
            }
            .font(.custom(CustomFont.poppinsMedium.rawValue, size: 15))
        }
    }
}

#Preview {
    SpicyView(spicyLevel: .constant(0.4))
}
