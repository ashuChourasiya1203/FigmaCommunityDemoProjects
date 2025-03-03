//
//  FoodItemView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 04/03/25.
//

import SwiftUI

// MARK: - Food Item View
struct FoodItemView: View {
    var food: FoodItem
    let screenWidth = UIScreen.main.bounds.width
    @State private var isSelected = false
    
    var body: some View {
        VStack(spacing: 5) {
            Image(uiImage: self.food.image)
                .resizable()
                .scaledToFit()
                .frame(width: (self.screenWidth-120)/2, height: (self.screenWidth-120)/2)
                .padding(.top, 10)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 1)
            
            Spacer().frame(height: 5)
            
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(self.food.name)
                        .font(.headline)
                    
                    Text(self.food.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(self.food.rating, specifier: "%.1f")")
                        
                        Spacer()
                        
                        Button {
                            self.isSelected.toggle()
                            
                            if self.isSelected {
                                FavFoods.append(self.food)
                            } else {
                                FavFoods.removeAll { $0.id == food.id }
                            }
                            
                        } label: {
                            Image(systemName: self.isSelected ? "heart.fill" : "heart")
                                .resizable()
                                .fontWeight(.semibold)
                                .frame(width: 24, height: 22)
                                .foregroundColor(self.isSelected ? .themeRed : .theme3C2F2F)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .offset(x: 13, y: -1)
                    }
                }
                Spacer()
            }
            .offset(y: -15)
        }
        .padding()
        .frame(width: (self.screenWidth-60)/2, height: self.screenWidth/2 + 30)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 1)
        .onAppear {
            self.isSelected = FavFoods.contains { $0.id == self.food.id }
        }
    }
}
