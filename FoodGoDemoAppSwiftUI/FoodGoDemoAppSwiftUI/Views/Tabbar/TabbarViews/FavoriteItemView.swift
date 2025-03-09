//
//  FavoriteItemView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 04/03/25.
//

import SwiftUI

struct FavoriteItemView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(FavFoods) { item in
                        FoodItemView(food: item)
                    }
                }
                .padding(.top, 15)
                .padding(.horizontal, 20)
                .padding(.bottom, 120)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My Favorites ❤️")
                        .font(.custom(CustomFont.lobsterRegular.rawValue, size: 35))
                        .foregroundColor(.theme3C2F2F)
                }
            }
        }
    }
}
