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
    @State private var isShowTabbar = true
    @State private var isShowDetailView = false
    
    var body: some View {
        NavigationStack {
            if self.isShowSplash {
                SplashView()
            } else {
                ZStack {
                    self.showSelectedView(for: self.selectedTab)
                        .navigationDestination(isPresented: self.$isShowDetailView) {
                            UserProfileView()
                        }
                    
                    VStack {
                        Spacer()
                        if self.isShowTabbar {
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
            self.isShowDetailView = false
            
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
        default: return AnyView(HomeView(isShowUserDetailView: self.$isShowDetailView))
        }
    }
}

#Preview {
    ContentView()
}
