//
//  UserProfileView.swift
//  FoodGoDemoAppSwiftUI
//
//  Created by Ashutosh Chourasiya on 07/03/25.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(.icUserProfileBg)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .ignoresSafeArea()

                VStack {
                    NavigationBar(isUserProfile: true)
                        .padding(.top, -5)
                    
                    ZStack(alignment: .top) {
                        WhiteBackgroundView(size: geometry.size)

                        VStack {
                            UserProfileImage(imageWidth: geometry.size.width/3)
                            UserProfileContent()
                            ProfileButtons()
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .background(.green)
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func WhiteBackgroundView(size: CGSize) -> some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .frame(width: size.width, height: size.height * 0.9)
            .clipShape(RoundedCornerShape(radius: 25, corners: [.topLeft, .topRight]))
            .offset(y: size.height * 0.1)
    }
}

/// Custom shape for rounding only top corners
struct RoundedCornerShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: self.corners,
            cornerRadii: CGSize(width: self.radius, height: self.radius)
        )
        return Path(path.cgPath)
    }
}

struct UserProfileImage: View {
    let imageWidth: CGFloat
    
    var body: some View {
        Image(.icAvatar1)
            .resizable()
            .scaledToFill()
            .frame(width: self.imageWidth, height: self.imageWidth)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(.themeRed, lineWidth: 5)
            )
            .offset(y: 10)
            .padding(.bottom, 30)
            .shadow(color: .themeRed.opacity(0.5), radius: 5, y: 10)
    }
}

struct UserProfileContent: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CustomTextField(title: "Name", value: "Ashutosh Chourasiya")
                CustomTextField(title: "Email", value: "ashutosh@gmail.com")
                CustomTextField(title: "Delivery address", value: "123 Main St Apartment 4A, New York, NY, 123 Main St Apartment 4A, New York")
                CustomTextField(title: "Password", value: "•••••••••")
                
                Divider().frame(height: 15)
                
                MenuOption(title: "Payment Details")
                MenuOption(title: "Order history")
            }
            .padding()
            .background(.white)
        }
    }
}

struct CustomTextField: View {
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.value)
                    .font(.custom(CustomFont.poppinsMedium.rawValue, size: 16))
                    .padding(.horizontal, 5)
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12).stroke(.theme6A6A6A.opacity(0.5))
            )
        }
        .overlay {
            HStack {
                ZStack {
                    Text(self.title)
                        .font(.custom(CustomFont.poppinsMedium.rawValue, size: 15))
                        .padding(.horizontal, 7)
                        .foregroundStyle(.theme6A6A6A.opacity(0.8))
                }
                .background(.blue)
                .offset(x: 13, y: -27)
                
                Spacer()
            }
        }
    }
}

struct MenuOption: View {
    var title: String

    var body: some View {
        HStack {
            Text(self.title).font(.custom(CustomFont.poppinsRegular.rawValue, size: 16))
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal, 10)
        .foregroundColor(.theme6A6A6A)
    }
}

struct ProfileButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {}) {
                HStack {
                    Text("Edit Profile")
                    Image(systemName: "square.and.pencil")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.theme3C2F2F)
                .foregroundColor(.white)
                .cornerRadius(15)
            }

            Button(action: {}) {
                HStack {
                    Text("Log out")
                    Image(systemName: "arrow.right.to.line")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.themeRed, lineWidth: 2)
                )
                .foregroundColor(.themeRed)
            }
        }
        .frame(height: 60)
        .font(.custom(CustomFont.poppinsMedium.rawValue, size: 18))
        .padding(.horizontal, 15)
        .padding(.bottom, 15)
    }
}

#Preview {
    UserProfileView()
}
