//
//  OTPTextFieldModifier.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 03.07.2024.
//

import SwiftUI

struct OTPTextFieldModifier: ViewModifier {
    
    // MARK: - Properties
    
    public var type: OTPTextField.ViewType
    public let size: CGSize
    public let color: Color
    
    // MARK: - Body
    
    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad)
            .frame(width: size.width, height: size.height)
            .background(color)
            .cornerRadius(12)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: Constants.fontSize, weight: .medium))
            .accentColor(.clear)
            .multilineTextAlignment(.center)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(type.borderColor)
            )
    }
}

// MARK: - Nested types

private extension OTPTextFieldModifier {
    enum Constants {
        static var fontSize: CGFloat {
            let isIPad = UIDevice.current.userInterfaceIdiom == .pad
            return isIPad ? 36 : 24
        }
    }
}

extension View {
    func otpTextField(
        with type: OTPTextField.ViewType,
        size: CGSize,
        color: Color
    ) -> some View {
        modifier(OTPTextFieldModifier(
            type: type, size: size, color: color
        ))
    }
}
