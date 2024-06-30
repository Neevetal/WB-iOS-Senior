//
//  PurpleButtonStyle.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 30.06.2024.
//

import SwiftUI

struct PurpleButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(14)
            .background(AppColor.Background.purple)
            .foregroundColor(AppColor.Text.white)
            .font(.montserratFont(size: 16, weight: .medium))
            .opacity(isEnabled ? 1 : 0.8)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
