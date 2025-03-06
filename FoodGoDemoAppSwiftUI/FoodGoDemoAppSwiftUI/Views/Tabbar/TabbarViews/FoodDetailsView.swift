//
//  FoodDetailsView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 04/03/25.
//

import SwiftUI

struct FoodDetailsView: View {
    var food: FoodItem
    @State private var quantity = 1
    @State private var spicyLevel = 0.3
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            NavigationBar(isSearch: false)
            ScrollView {
                self.FoodImage()
                self.FoodDetails()
                
                HStack {
                    SpicyView(spicyLevel: self.$spicyLevel)
                        .frame(width: self.screenWidth * 0.35)
                    
                    Spacer()
                    
                    PortionView(quantity: self.$quantity)
                        .frame(width: self.screenWidth * 0.30)
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                .offset(y: -30)
                
                HStack {
                    Text("$\((self.food.price ?? 10.57) * Double(self.quantity), specifier: "%.2f")")
                        .font(.custom(CustomFont.poppinsMedium.rawValue, size: 20))
                        .frame(width: 120, height: 60)
                        .background(.themeRed)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer()
                    
                    Button {
                        // Order action
                    } label: {
                        Text("ORDER NOW")
                            .font(.custom(CustomFont.poppinsMedium.rawValue, size: 20))
                            .frame(width: 180, height: 60)
                            .background(.theme3C2F2F)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                .offset(y: -15)
            }
        }
        .navigationBarHidden(true)
    }
    
    private func FoodImage() -> some View {
        Image(uiImage: self.food.image)
            .resizable()
            .scaledToFit()
            .frame(width: self.screenWidth * 0.9, height: self.screenWidth * 0.8)
            .shadow(color: .black.opacity(0.5), radius: 10, y: 15)
            .offset(y: -30)
            .padding(.bottom, 15)
    }
    
    private func FoodDetails() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text(self.food.name)
                    .font(.custom(CustomFont.poppinsRegular.rawValue, size: 25))
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                    Text("\(self.food.rating, specifier: "%.1f")")
                    Text("- \(Int.random(in: 15...50)) mins")
                        .foregroundColor(.gray)
                }
            }
            Text(self.food.description)
                .font(.custom(CustomFont.poppinsRegular.rawValue, size: 14))
                .foregroundColor(.theme3C2F2F)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal)
        .offset(y: -50)
    }
}

#Preview {
    FoodDetailsView(food: MockData.foodItems[1])
}
