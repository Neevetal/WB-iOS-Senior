//
//  AuthorizationPhonePopupView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct AuthorizationPhonePopupView: View {
    
    // MARK: - Property Wrappers
    
    @State private var isError = false
    @ObservedObject private var user: User
    @Binding private var step: AuthorizationStep
    
    // MARK: - Initialization and deinitialization
    
    init(
        user: ObservedObject<User>,
        step: Binding<AuthorizationStep>
    ) {
        _user = user
        _step = step
    }
    
    // MARK: - Body
    
    var body: some View {
        PopupView {
            VStack(spacing: 0) {
                authorizationText
                roundImage
                loginPhoneNumberText
                phoneTextField
                requestCodeButton
            }
            .hideKeyboardOnTap()
        }
        .hideKeyboardOnTap()
    }
}

// MARK: - UI Properties

private extension AuthorizationPhonePopupView {
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
            phoneNumber: $user.phone,
            isError: $isError,
            mask: Constants.phoneMask,
            errorText: AppString.Authorization.incorrectNumberFormat
        )
        .padding(.top, 32)
        .padding(.horizontal, 24)
    }
    
    @ViewBuilder
    private var requestCodeButton: some View {
        Button(AppString.Authorization.requestCode) {
            getCode()
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(24)
        .padding(.bottom, 24)
        .disabled(user.phone.count < 5)
    }
}

// MARK: - Private methods

private extension AuthorizationPhonePopupView {
    func getCode() {
        withAnimation(Constants.errorAnimation) {
            isError = !user.isPhoneValid
        }
        
        if !isError {
            withAnimation {
                step = .code
            }
        }
    }
}

// MARK: - Nested types

extension AuthorizationPhonePopupView {
    enum Constants {
        static let phoneMask: String = "+7 (___) ___ - __ - __"
        static let errorAnimation: Animation = .easeInOut(duration: 0.2)
    }
}

// MARK: - Stubable

extension AuthorizationPhonePopupView: Stubable {
    static func stub() -> AuthorizationPhonePopupView {
        return AuthorizationPhonePopupView(
            user: .init(initialValue: .init(phone: "", code: "")),
            step: .constant(.phone)
        )
    }
}

// MARK: - Preview

#Preview {
    AuthorizationPhonePopupView.stub()
}
