//
//  TabBarButtom.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 01/03/25.
//

import SwiftUI

// MARK: - Tab Bar Button
struct TabBarButton: View {
    var image: UIImage
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Image(uiImage: self.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(self.isSelected ? .white : .white.opacity(0.8))
            
            Circle()
                .fill(self.isSelected ? .white : .clear)
                .frame(width: 8, height: 8)
        }
        .frame(width: 45, height: 50)
    }
}
