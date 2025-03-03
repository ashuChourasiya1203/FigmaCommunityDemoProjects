//
//  HomeView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 02/03/25.
//

import SwiftUI

var FavFoods: [FoodItem] = []

struct HomeView: View {
    @AppStorage("searchText") private var searchText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView()
            SearchView()
            CategoryView()
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(MockData.foodItems) { item in
                        FoodItemView(food: item)
                    }
                }
                .padding(.top, 5)
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
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
    
    private func SearchView() -> some View {
        HStack(spacing: 15) {
            HStack(alignment: .center, spacing: 0) {
                Image(.icSearch)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                TextField("Search", text: self.$searchText)
                    .padding()
                    .frame(height: 60)
                    .background(.clear)
                    .tint(.black)
                    .font(.custom(CustomFont.poppinsMedium.rawValue, size: 17))
            }
            .padding(.horizontal, 20)
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
    }
    
    private struct CategoryView: View {
        @State private var selectedCategory: String = "All"
        private let categories = ["All", "Combos", "Sliders", "Classic", "Burgers"]
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(self.categories, id: \.self) { category in
                        CategoryButton(title: category, isSelected: self.selectedCategory == category)
                        .onTapGesture {
                            self.selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical, 5)
        }
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
                color: self.isSelected ? .black.opacity(0.3) : .clear,
                radius: self.isSelected ? 5 : 0
            )
            .frame(height: 60)
    }
}

// MARK: - Food Item Model
struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: UIImage
    var rating: Double
}

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

#Preview {
    ContentView()
}

struct MockData {
    static let foodItems = [
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5),
        FoodItem(name: "Cheeseburger", description: "Wendy's Burger", image: .burgur1, rating: 4.9),
        FoodItem(name: "Veggie Burger", description: "Veggie Burger", image: .burgur2, rating: 4.8),
        FoodItem(name: "Chicken Burger", description: "Chicken Burger", image: .burgur3, rating: 4.6),
        FoodItem(name: "Fried Chicken Burger", description: "Fried Chicken Burger", image: .burgur4, rating: 4.5)
    ]
}
