//
//  BackTextButton.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 04.07.2024.
//

import SwiftUI

struct BackTextButton: View {
    
    // MARK: - Properties
    
    private let text: String
    private let action: () -> Void
    
    // MARK: - Initialization and deinitialization
    
    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    // MARK: - Body
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: Constants.iconName)
                Text(text)
                    .font(.montserratFont(size: 14, weight: .regular))
            }
            .foregroundColor(AppColor.Text.White.main.color)
        }
    }
}

// MARK: - Nested types

private extension BackTextButton {
    enum Constants {
        static let iconName: String = "chevron.left"
    }
}

// MARK: - Stubable

extension BackTextButton: Stubable {
    static func stub() -> any View {
        return BackTextButton(
            text: AppString.Authorization.comeBack
        ) {}
            .padding()
            .background(Color.gray)
    }
}

// MARK: - Preview

#Preview {
    BackTextButton.stub()
}
