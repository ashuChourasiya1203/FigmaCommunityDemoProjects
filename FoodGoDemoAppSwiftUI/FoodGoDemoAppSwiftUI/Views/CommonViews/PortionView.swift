//
//  PortionView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 06/03/25.
//

import SwiftUI

struct PortionView: View {
    @Binding var quantity: Int
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Portion")
                    .font(.custom(CustomFont.poppinsMedium.rawValue, size: 18))
                Spacer()
            }
            HStack {
                ZStack {
                    HStack {
                        self.stepperButton(imageName: "minus") {
                            if self.quantity > 1 {
                                self.quantity -= 1
                            }
                        }
                        Spacer(minLength: 40)
                        self.stepperButton(imageName: "plus") {
                            self.quantity += 1
                        }
                    }
                    Text("\(self.quantity)")
                        .font(.custom(CustomFont.poppinsMedium.rawValue, size: 16))
                }
            }
        }
    }
    
    private func stepperButton(imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: imageName)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(.themeRed)
                .clipShape(.rect(cornerRadius: 10))
                .shadow(color: .yellow.opacity(0.4), radius: 4, y: 4)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    PortionView(quantity: .constant(2))
}
