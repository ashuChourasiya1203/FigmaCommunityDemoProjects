//
//  TabbarView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 27/02/25.
//

import SwiftUI

struct TabbarView: View {
    @Binding var selectedTab: Int
    @Binding var isFloatingButtonClicked: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    Button {
                        self.isFloatingButtonClicked = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 28, weight: .black))
                            .foregroundColor(.white)
                            .frame(width: 8040, height: 80)
                            .background(Circle().fill(.themeRed).shadow(radius: 6))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .position(x: UIScreen.main.bounds.width/2, y: -15)
                    .shadow(color: .black.opacity(0.3), radius: 10)
                    
                    CurvedTabBarShape()
                        .fill(.themeRed)
                        .frame(height: 90)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -3)
                    
                    HStack {
                        TabBarButton(image: .icHome, isSelected: self.selectedTab == 0)
                            .onTapGesture { self.selectedTab = 0 }
                        
                        Spacer()
                        
                        TabBarButton(image: .icPerson, isSelected: self.selectedTab == 1)
                            .onTapGesture { self.selectedTab = 1 }
                        
                        Spacer().frame(width: 120) /// Space for floating button
                        
                        TabBarButton(image: .icComment, isSelected: self.selectedTab == 2)
                            .onTapGesture { self.selectedTab = 2 }
                        
                        Spacer()
                        
                        TabBarButton(image: .icHeart, isSelected: self.selectedTab == 3)
                            .onTapGesture { self.selectedTab = 3 }
                    }
                    .padding(.horizontal, 30)
                    .frame(height: 80)
                }
                .frame(height: 90)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    TabbarView(
        selectedTab: .constant(0),
        isFloatingButtonClicked: .constant(false)
    )
}
