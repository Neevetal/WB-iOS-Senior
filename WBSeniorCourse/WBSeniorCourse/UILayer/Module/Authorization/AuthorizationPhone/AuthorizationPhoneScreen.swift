//
//  AuthorizationPhoneScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct AuthorizationPhoneScreen: View {
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            AppColor.Background.Purple.dark.color
            
            // вынести центр подложку как кастом баттон с вью билдером из видео
            
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: AppColor.Gradient.darkPurple.gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                VStack(spacing: 0) {
                    
                    // вынести компоненты в переменные с вью билдером
                    
                    Text(AppString.Authorization.authorization)
                        .foregroundColor(AppColor.Text.white.color)
                        .font(.montserratFont(size: 24, weight: .semiBold))
                        .padding(.top, 40)
                    
                    RoundImage(
                        imageIcon: .Asset.Authorization.profileIcon.image,
                        sideSize: 96
                    )
                    .padding(.top, 28)
                    
                    Text(AppString.Authorization.loginPhonenumber)
                        .foregroundColor(AppColor.Text.white.color)
                        .font(.montserratFont(size: 16, weight: .regular))
                        .padding(.top, 16)
                    
                    Rectangle()
                        .background(Color.red)
                        .padding(.top, 32)
                        .padding(.horizontal, 24)
                    
                    Button(AppString.Authorization.requestCode) {
                        print("Button pressed!")
                    }
                    .buttonStyle(PurpleButtonStyle())
                    .cornerRadius(12)
                    .padding(24)
                    .padding(.bottom, 24)
                    .disabled(false)
                }
            }
            .frame(
                minWidth: 300,
                maxWidth: UIDevice.current.userInterfaceIdiom == .pad ? 400 : 300
            )
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(28)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview

#Preview {
    AuthorizationPhoneScreen()
}
