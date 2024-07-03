//
//  OTPTextFieldModifier.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 03.07.2024.
//

import SwiftUI

struct OTPTextFieldModifier: ViewModifier {
    private var fontSize: CGFloat {
        let isIPad = UIDevice.current.userInterfaceIdiom == .pad
        return isIPad ? 36 : 24
    }
    
    var size: CGSize
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .keyboardType(.numberPad)
            .frame(width: size.width, height: size.height)
            .background(color)
            .cornerRadius(12)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: fontSize, weight: .medium))
            .accentColor(.clear)
            .multilineTextAlignment(.center)
    }
}

extension View {
    func otpTextField(with size: CGSize, color: Color) -> some View {
        modifier(OTPTextFieldModifier(size: size, color: color))
    }
}
