//
//  ContentView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 25/02/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                Image(.splashBackground)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                Text(StringValue.foodgo)
                    .foregroundColor(.white)
                    .font(.custom(CustomFont.lobsterRegular.rawValue, size: 55))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .offset(y: -130)
                
                VStack {
                    Spacer()
                    ZStack {
                        Image(.splashBurgur1)
                            .resizable()
                            .frame(width: 220, height: 290)
                            .offset(x: -45, y: 35)
                        Image(.splashBurgur2)
                            .resizable()
                            .frame(width: 170, height: 200)
                            .offset(x: 70, y: 55)
                    }
                    .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 1)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    SplashView()
}
