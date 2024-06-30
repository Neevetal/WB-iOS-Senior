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
            // view фона (градиент)
            
            ZStack {
                // view фон подложки (блюр)
                Rectangle()
                    .fill(.green)
                VStack(spacing: 0) {
                    Text(AppString.Authorization.authorization)
                        .foregroundColor(AppColor.Text.white)
                    .font(.montserratFont(size: 24, weight: .semiBold))
                    .padding(.top, 40)
                    
                    RoundImage(sideSize: 96)
                        .padding(.top, 28)
                    
                    Text(AppString.Authorization.loginPhonenumber)
                        .foregroundColor(AppColor.Text.white)
                        .font(.montserratFont(size: 16, weight: .regular))
                        .padding(.top, 16)
                    
                    PhoneTextField()
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
            .fixedSize(horizontal: true, vertical: true)
            .cornerRadius(28)
        }
    }
}

// MARK: - Preview

#Preview {
    AuthorizationPhoneScreen()
}
