//
//  AuthorizationCodeScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct AuthorizationCodeScreen: View {
    
    // MARK: - Property Wrappers
    
    @State private var otpType: OTPTextField.ViewType = .main
    @State private var code: String = ""
    @State private var isNeedRepeatCode: Bool = true
    @State private var repeatCodeSeconds: Int = Constants.defaultRepeatCodeSeconds
    
    // MARK: - Properties
    
    private let phoneNumber: String
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    // MARK: - Initialization and deinitialization
    
    init(phoneNumber: String = "+7 (921) 233-123-44") {
        self.phoneNumber = phoneNumber
    }
    
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
                            repeatСodeButton
                            authorizationButton
                        }
                        .hideKeyboardOnTap()
                    }
                    backButton
                }
                .hideKeyboardOnTap()
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
            type: $otpType,
            fieldCount: Constants.fieldCount,
            fieldColor: AppColor.Background.White.main08.color,
            errorText: AppString.Authorization.incorrectPassword,
            code: $code
        )
        .padding(.top, 24)
    }
    
    @ViewBuilder
    private var repeatСodeButton: some View {
        Button(
            isNeedRepeatCode
            ? AppString.Authorization.requestTheCodeAgain(String(repeatCodeSeconds))
            : AppString.Authorization.requestCode
        ) {
            print("Код запрошен")
        }
        .onReceive(timer) { time in
            if repeatCodeSeconds > 0 {
                repeatCodeSeconds -= 1
            } else {
                isNeedRepeatCode = false
            }
        }
        .foregroundColor(AppColor.Text.White.main.color)
        .font(.montserratFont(size: 14, weight: .regular))
        .padding(.top, 15)
        .disabled(isNeedRepeatCode)
    }
    
    @ViewBuilder
    private var authorizationButton: some View {
        Button(AppString.Authorization.login) {
            repeatCodeSeconds = Constants.defaultRepeatCodeSeconds
            withAnimation(Constants.otpAnimation) {
                // добавить вызов ошибки otp
                // otpType = .error
                
                otpType = .succes
            }
            
            print("Авторизация, код", code)
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(.all, 24)
        .disabled(code.count != Constants.fieldCount)
    }
    
    @ViewBuilder
    private var backButton: some View {
        BackTextButton(
            text:  AppString.Authorization.comeBack
        ) {
            print("Вернулись назад")
        }
        .padding(.top, 32)
    }
}

// MARK: - Nested types

extension AuthorizationCodeScreen {
    enum Constants {
        static let fieldCount: Int = 4
        static let defaultRepeatCodeSeconds: Int = 60
        static let otpAnimation: Animation = .easeInOut(duration: 0.2)
    }
}

// MARK: - Preview

#Preview {
    AuthorizationCodeScreen()
}
