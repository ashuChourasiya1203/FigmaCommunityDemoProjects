//
//  ContentView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 27/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowSplash = true
    @State private var selectedTab = 0
    @State private var isFloatingButtonClicked = false
    
    var body: some View {
        NavigationStack {
            if self.isShowSplash {
                SplashView()
            } else {
                NavigationStack {
                    ZStack {
                        self.showSelectedView(for: self.selectedTab)
                        VStack {
                            Spacer()
                            TabbarView(
                                selectedTab: self.$selectedTab,
                                isFloatingButtonClicked: self.$isFloatingButtonClicked
                            )
                        }
                    }
                }
            }
        }
        .onAppear {
            self.isFloatingButtonClicked = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isShowSplash = false
            }
        }
    }
    
    private func showSelectedView(for selectedTab: Int) -> some View {
        switch selectedTab {
        case 1: return AnyView(ProfileView())
        case 2: return AnyView(ChatView())
        case 3: return AnyView(FavoriteItemView())
        default: return AnyView(HomeView())
        }
    }
}

#Preview {
    ContentView()
}
