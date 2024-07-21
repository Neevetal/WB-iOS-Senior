//
//  AuthorizationCodePopupView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct AuthorizationCodePopupView: View {
    
    // MARK: - Property Wrappers
    
    @Binding private var step: AuthorizationStep
    @StateObject private var user: User
    @State private var otpType: OTPTextField.ViewType = .main
    @State private var isNeedRepeatCode: Bool = true
    @State private var repeatCodeSeconds: Int = Constants.defaultRepeatCodeSeconds
    @State private var isLoading: Bool = false
    
    // MARK: - Properties
    
    private let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    // MARK: - Initialization and deinitialization
    
    init(
        user: StateObject<User>,
        step: Binding<AuthorizationStep>
    ) {
        _user = user
        _step = step
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            PopupView(isLoading: isLoading) {
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
                .opacity(isLoading ? 0 : 1)
        }
        .hideKeyboardOnTap()
    }
}

// MARK: - UI Properties

private extension AuthorizationCodePopupView {
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
        Text(format(user.phone))
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
            code: $user.code
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
            if repeatCodeSeconds <= 0 {
                repeatCodeSeconds = Constants.defaultRepeatCodeSeconds
            }
            
            getUser()
        }
        .buttonStyle(PurpleButtonStyle())
        .cornerRadius(12)
        .padding(.all, 24)
        .disabled(user.code.count != Constants.fieldCount)
    }
    
    @ViewBuilder
    private var backButton: some View {
        BackTextButton(
            text: AppString.Authorization.comeBack
        ) {
            withAnimation {
                step = .phone
            }
        }
        .padding(.top, 32)
    }
}

// MARK: - Private methods

private extension AuthorizationCodePopupView {
    func getUser() {
        let randomBool = Bool.random()
        
        withAnimation(Constants.otpAnimation) {
            otpType = randomBool ? .succes : .error
        }
        
        if randomBool {
            print("Авторизация")
            print("Телефон", user.phone)
            print("Код", user.code)
            
            withAnimation(Constants.loadingAnimation) {
                isLoading = true
            }
        }
    }
    
    func format(_ input: String) -> String {
        let mask = Constants.phoneMask
        var inputArray = Array(input)
        var result: Array<Character> = []
        
        for index in 0 ..< mask.count {
            let maskCharacterIndex = String.Index(utf16Offset: index, in: mask)
            let maskCharacter = mask[maskCharacterIndex]
            
            guard let firstInputCharacter = inputArray.first
            else {
                result.append(maskCharacter)
                continue
            }
            
            if (maskCharacter == firstInputCharacter || maskCharacter == "_") {
                result.append(firstInputCharacter)
                inputArray.removeFirst()
            } else {
                result.append(maskCharacter)
            }
        }
        
        return String(result)
    }
}

// MARK: - Nested types

extension AuthorizationCodePopupView {
    enum Constants {
        static let phoneMask: String = "+7 (___) ___ - __ - __"
        static let fieldCount: Int = 4
        static let defaultRepeatCodeSeconds: Int = 60
        static let otpAnimation: Animation = .easeInOut(duration: 0.2)
        static let loadingAnimation: Animation = .easeInOut(duration: 0.2)
    }
}

// MARK: - Stubable

extension AuthorizationCodePopupView: Stubable {
    static func stub() -> any View {
        return AuthorizationCodePopupView(
            user: .init(wrappedValue: .init(phone: "+70985453434", code: "")),
            step: .constant(.phone)
        )
    }
}

// MARK: - Preview

#Preview {
    AuthorizationCodePopupView.stub()
}
