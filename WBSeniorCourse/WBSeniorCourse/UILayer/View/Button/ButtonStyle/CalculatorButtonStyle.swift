//
//  CalculatorButtonStyle.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .frame(width: 40, height: 40)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(.horizontal, 8)
    }
}
