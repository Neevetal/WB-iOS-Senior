//
//  AuthorizationCodeScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct AuthorizationCodeScreen: View {
    
    // MARK: - Properties
    
    @State private var code = ""
    @State private var phoneNumber = "+7 (921) 233-123-44"
    
    // MARK: - Body
    
    var body: some View {
        ZStack() {
            BackgroundImageView(
                image: .Asset.Common.Background.purpleBackgroundImage.image,
                color: Color.black
            ) {
                VStack(spacing: 0) {
                    PopupView {
                        VStack(spacing: 0) {
                            mailImage
                            phoneNumberText
                            otpTextField
                            repeatСodeText
                            authorizationButton
                        }
                    }
                    backButton
                }
            }
        }
    }
}

// MARK: - UI Properties

private extension AuthorizationCodeScreen {
    @ViewBuilder
    private var mailImage: some View {
        Image(uiImage: .Asset.Authorization.mailIcon.image)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .padding(.top, 40)
    }
    
    @ViewBuilder
    private var phoneNumberText: some View {
        Text(phoneNumber)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 24, weight: .semiBold))
            .padding(.top, 16)
    }
    
    @ViewBuilder
    private var otpTextField: some View {
        OTPTextField(
            numberOfFields: 4, color: AppColor.Background.White.main08.color
        )
        .padding(.top, 24)
    }
    
    @ViewBuilder
    private var repeatСodeText: some View {
        Rectangle()
            .fill(Color.yellow)
            .padding(.top, 15)
    }
    
    @ViewBuilder
    private var authorizationButton: some View {
        Button(AppString.Authorization.login) {
            print("AuthorizationButton pressed!")
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(24)
        .padding(.bottom, 24)
        .disabled(false) // от содержимого филда кода
    }
    
    @ViewBuilder
    private var backButton: some View {
        Rectangle()
            .fill(Color.yellow)
            .frame(height: 50)
            .padding(.top, 32)
    }
}

// MARK: - Preview

#Preview {
    AuthorizationCodeScreen()
}
