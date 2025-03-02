//
//  HomeView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 02/03/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView()
            
            ScrollView {
                HStack(spacing: 15) {
                    HStack(alignment: .center, spacing: 0) {
                        Image(.icSearch)
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        TextField("Search", text: self.$searchText)
                            .padding()
                            .frame(height: 60)
                            .background(.clear)
                            .tint(.black)
                            .font(.custom(CustomFont.poppinsMedium.rawValue, size: 17))
                    }
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.1), radius: 6)
                    .frame(height: 60)
                    
                    Button(action: {
                        
                    }) {
                        ZStack {
                            Rectangle().foregroundColor(.themeRed)
                            Image(.icFilter).resizable()
                        }
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(width: 60, height: 60)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 15)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        CategoryButton(title: "All", isSelected: true)
                        CategoryButton(title: "Combos")
                        CategoryButton(title: "Sliders")
                        CategoryButton(title: "Classic")
                        CategoryButton(title: "Burgurs")
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 15)
                
                // Food Items Grid
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(MockData.foodItems) { item in
                        FoodItemView(food: item)
                    }
                }
                .padding()
            }
            
            Spacer()
        }
    }
    
    private func HeaderView() -> some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text(StringValue.foodgo)
                    .foregroundColor(.theme3C2F2F)
                    .font(.custom(CustomFont.lobsterRegular.rawValue, size: 40))
                
                Text(StringValue.orderYourFavrouriteFood)
                    .foregroundColor(.theme6A6A6A)
                    .font(.custom(CustomFont.poppinsRegular.rawValue, size: 18))
            }
            Spacer()
            
            Button {
                
            } label: {
                Image(.icAvatar)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(.rect(cornerRadius: 10))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal)
    }
}

// MARK: - Category Button Component
struct CategoryButton: View {
    var title: String
    var isSelected: Bool = false
    
    var body: some View {
        Text(self.title)
            .font(.custom(CustomFont.poppinsRegular.rawValue, size: 16))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(self.isSelected ? .themeRed : Color(.systemGray5))
            .foregroundColor(self.isSelected ? .white : .black)
            .cornerRadius(20)
            .shadow(
                color: self.isSelected ? .black : .clear,
                radius: self.isSelected ? 10 : 0
            )
            .frame(height: 60)
    }
}

// MARK: - Food Item Model
struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var rating: Double
}

struct MockData {
    static let foodItems = [
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", imageName: "cheeseburger", rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", imageName: "veggie_burger", rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", imageName: "chicken_burger", rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", imageName: "fried_chicken_burger", rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", imageName: "cheeseburger", rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", imageName: "veggie_burger", rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", imageName: "chicken_burger", rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", imageName: "fried_chicken_burger", rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", imageName: "cheeseburger", rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", imageName: "veggie_burger", rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", imageName: "chicken_burger", rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", imageName: "fried_chicken_burger", rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", imageName: "cheeseburger", rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", imageName: "veggie_burger", rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", imageName: "chicken_burger", rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", imageName: "fried_chicken_burger", rating: 4.5)
    ]
}

// MARK: - Food Item View
struct FoodItemView: View {
    var food: FoodItem
    
    var body: some View {
        VStack {
            Image(self.food.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text(self.food.name)
                .font(.headline)
            
            Text(self.food.description)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(self.food.rating, specifier: "%.1f")")
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ContentView()
}
