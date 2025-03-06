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
                            .contentShape(Rectangle()) // Makes the whole view tappable without default highlight
                            .simultaneousGesture(
                                LongPressGesture().onChanged { _ in
                                    print("Long Press Triggered!")
                                }
                            )
                    }
                }
                .padding(.top, 5)
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
            Spacer()
        }
        .offset(y: -10)
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
                //Show Profile View on click of this button
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
                
                TextField("", text: self.$searchText, prompt: Text(StringValue.search)
                    .foregroundColor(.theme3C2F2F)
                    .font(.custom(CustomFont.poppinsMedium.rawValue, size: 17))
                )
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
                //Show Filter View on click of this button
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
        .padding(.vertical, 5)
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

#Preview {
    ContentView()
}
