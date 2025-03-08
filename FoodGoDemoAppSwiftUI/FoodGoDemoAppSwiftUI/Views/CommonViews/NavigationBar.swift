//
//  NavigationBar.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 05/03/25.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    var isSearch: Bool = false
    var isUserProfile: Bool = false
    
    var body: some View {
        HStack {
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                if self.isUserProfile {
                    Image(.icBackWhite)
                        .resizable()
                        .frame(width: 28, height: 28)
                } else {
                    Image(.icBack)
                        .resizable()
                        .frame(width: 35, height: 30)
                }
            }
            Spacer()
            
            if self.isUserProfile {
                Image(.icSetting)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .fontWeight(.medium)
            } else {
                Image(self.isSearch ? .icSearch : .icMenu)
                    .resizable()
                    .frame(width: self.isSearch ? 25 : 20, height: self.isSearch ? 25 : 15)
                    .fontWeight(.medium)
                    .offset(x: -10)
            }
        }
        .frame(height: 30)
        .padding(.horizontal, 10)
    }
}
