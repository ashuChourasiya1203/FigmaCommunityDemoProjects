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
        NavigationLink(destination: FoodDetailsView(food: self.food)) {
            VStack(spacing: 5) {
                Image(uiImage: self.food.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: (self.screenWidth-130)/2, height: (self.screenWidth-130)/2)
                    .padding(.top, 10)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 1)
                
                Spacer().frame(height: 10)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(self.food.name)
                            .font(.headline)
                            .foregroundColor(.black)
                        
                        Text(self.food.description)
                            .font(.subheadline)
                            .foregroundColor(.theme6A6A6A)
                        
                        Spacer()
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.orange)
                            
                            Text("\(self.food.rating, specifier: "%.1f")")
                                .foregroundColor(.black)
                            
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
                                    .frame(width: 22, height: 20)
                                    .foregroundColor(self.isSelected ? .themeRed : .theme3C2F2F)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .offset(x: 10)
                        }
                    }
                    Spacer()
                }
                .offset(y: -20)
            }
            .padding(.all, 10)
            .frame(width: (self.screenWidth-60)/2, height: self.screenWidth/2 + 40)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 1)
            .onAppear {
                self.isSelected = FavFoods.contains { $0.id == self.food.id }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    FoodItemView(food: MockData.foodItems[1])
}
