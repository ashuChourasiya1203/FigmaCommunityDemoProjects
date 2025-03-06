//
//  NavigationBar.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 05/03/25.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    var isSearch: Bool
    
    var body: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(.icBack)
                    .resizable()
                    .frame(width: 35, height: 30)
            }
            Spacer()
            Image(self.isSearch ? .icSearch : .icMenu)
                .resizable()
                .frame(width: self.isSearch ? 25 : 20, height: self.isSearch ? 25 : 15)
                .fontWeight(.medium)
                .offset(x: -10)
        }
        .frame(height: 30)
        .padding(.horizontal, 10)
    }
}
