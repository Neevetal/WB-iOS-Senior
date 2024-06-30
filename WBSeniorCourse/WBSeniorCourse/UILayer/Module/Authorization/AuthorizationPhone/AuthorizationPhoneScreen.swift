//
//  AuthorizationPhoneScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct AuthorizationPhoneScreen: View {
    var body: some View {
        ZStack {
            // view фона (градиент)
            
            ZStack {
                // view фон подложки (блюр)
                Rectangle()
                    .fill(.green)
                VStack(spacing: 0) {
                    Text(AppString.Authorization.authorization)
                    .foregroundColor(.white)
                    .font(.montserratFont(size: 24, weight: .semiBold))
                    .padding(.top, 40)
                    
                    RoundImage(sideSize: 96)
                        .padding(.top, 28)
                    
                    Text(AppString.Authorization.loginPhonenumber)
                        .foregroundColor(.white)
                        .font(.montserratFont(size: 16, weight: .regular))
                        .padding(.top, 16)
                    
                    PhoneTextField()
                        .background(Color.red)
                        .padding(.top, 32)
                        .padding(.horizontal, 24)
                    
                    CustomButton()
                        .background(Color.red)
                        .padding(24)
                        .padding(.bottom, 24)
                    
                }
            }
            .fixedSize(horizontal: true, vertical: true)
            .cornerRadius(28)
        }
    }
}

#Preview {
    AuthorizationPhoneScreen()
}
