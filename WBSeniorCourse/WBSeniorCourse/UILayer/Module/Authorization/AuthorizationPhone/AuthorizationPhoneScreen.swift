//
//  AuthorizationPhoneScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct AuthorizationPhoneScreen: View {
    
    // MARK: - Properties
    
    @State private var phoneNumber = ""
    
    // MARK: - Body
    
    var body: some View {
        ZStack() {
            BackgroundImageView(
                image: .Asset.Common.Background.purpleBackgroundImage.image,
                color: Color.black
            ) {
                PopupView {
                    VStack(spacing: 0) {
                        authorizationText
                        roundImage
                        loginPhoneNumberText
                        phoneTextField
                        requestCodeButton
                    }
                }
            }
        }
    }
}

// MARK: - UI Properties

private extension AuthorizationPhoneScreen {
    @ViewBuilder
    private var authorizationText: some View {
        Text(AppString.Authorization.authorization)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 24, weight: .semiBold))
            .padding(.top, 40)
    }
    
    @ViewBuilder
    private var roundImage: some View {
        RoundImage(
            imageIcon: .Asset.Authorization.profileIcon.image,
            sideSize: 96
        )
        .padding(.top, 28)
    }
    
    @ViewBuilder
    private var loginPhoneNumberText: some View {
        Text(AppString.Authorization.loginPhoneNumber)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .regular))
            .padding(.top, 16)
    }
    
    @ViewBuilder
    private var phoneTextField: some View {
        PhoneTextField(
            phoneNumber: $phoneNumber,
            isError: .constant(false)
        )
        .padding(.top, 32)
        .padding(.horizontal, 24)
    }
    
    @ViewBuilder
    private var requestCodeButton: some View {
        Button(AppString.Authorization.requestCode) {
            print("RequestCodeButton pressed!")
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(24)
        .padding(.bottom, 24)
        .disabled(false) // от содержимого филда номера
    }
}

// MARK: - Preview

#Preview {
    AuthorizationPhoneScreen()
}
