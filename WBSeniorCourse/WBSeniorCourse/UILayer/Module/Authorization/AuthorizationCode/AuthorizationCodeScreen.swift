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
    
    @State var isNeedRepeatCode = false
    @State private var repeatCodeSeconds: Int = Constants.defaultRepeatCodeSeconds
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
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
            fieldCount: Constants.fieldCount,
            color: AppColor.Background.White.main08.color,
            code: $code
        )
        .padding(.top, 24)
    }
    
    @ViewBuilder
    private var repeatСodeText: some View {
        Text(
            AppString.Authorization
                .requestTheCodeAgain(String(repeatCodeSeconds))
        )
        .onReceive(timer) { time in
            if repeatCodeSeconds > 0 {
                repeatCodeSeconds -= 1
            } else {
                isNeedRepeatCode = false
            }
        }
        .foregroundColor(AppColor.Text.White.main.color)
        .font(.montserratFont(size: 14, weight: .regular))
        .opacity(isNeedRepeatCode ? 1 : 0)
        .padding(.vertical, isNeedRepeatCode ? 15 : 0)
    }
    
    @ViewBuilder
    private var authorizationButton: some View {
        Button(AppString.Authorization.login) {
            isNeedRepeatCode = true
            print("AuthorizationButton pressed!")
            print("Code", code)
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(.init(top: 9, leading: 24, bottom: 24, trailing: 24))
        .disabled(code.count != Constants.fieldCount)
    }
    
    @ViewBuilder
    private var backButton: some View {
        Rectangle()
            .fill(Color.yellow)
            .frame(height: 50)
            .padding(.top, 32)
    }
}

// MARK: - Nested types

extension AuthorizationCodeScreen {
    enum Constants {
        static let fieldCount: Int = 4
        static let defaultRepeatCodeSeconds: Int = 60
    }
}

// MARK: - Preview

#Preview {
    AuthorizationCodeScreen()
}
