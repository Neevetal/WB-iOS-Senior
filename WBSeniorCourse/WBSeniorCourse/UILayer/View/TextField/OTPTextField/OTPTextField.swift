//
//  OTPTextField.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.07.2024.
//

import SwiftUI

struct OTPTextField: View {
    
    // MARK: - Properties
    
    private let numberOfFields: Int
    private let color: Color
    @FocusState private var fieldFocus: Int?
    @State var enterValue: [String]
    @State var oldValue = ""
    
    // MARK: - Initialization and deinitialization
    
    init(numberOfFields: Int, color: Color) {
        self.numberOfFields = numberOfFields
        self.color = color
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Constants.stackSpacing) {
            ForEach(0 ..< numberOfFields, id: \.self) { index in
                TextField("", text: $enterValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                .otpTextField(with: Constants.size, color: color)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .onChange(of: enterValue[index]) { newValue in
                    if !newValue.isEmpty {
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            enterValue[index] = currentValue[0] == Character(oldValue)
                            ? String(enterValue[index].suffix(1))
                            : String(enterValue[index].prefix(1))
                        }
                        
                        fieldFocus = index == numberOfFields - 1
                        ? nil
                        : (fieldFocus ?? 0) + 1
                    } else {
                        fieldFocus = (fieldFocus ?? 0) - 1
                    }
                }
            }
        }
        .padding(.top, 18)
        .padding(.bottom, 30)
    }
}

// MARK: - Nested types

extension OTPTextField {
    enum Constants {
        static var stackSpacing: CGFloat {
            let isIPad = UIDevice.current.userInterfaceIdiom == .pad
            return isIPad ? 24 : 16
        }
        
        static var size: CGSize {
            let isIPad = UIDevice.current.userInterfaceIdiom == .pad
            return .init(
                width: isIPad ? 64 : 48,
                height: isIPad ? 80 : 60
            )
        }
    }
}

// MARK: - Stubable

extension OTPTextField: Stubable {
    static func stub() -> OTPTextField {
        return OTPTextField(
            numberOfFields: 4, color: .gray.opacity(0.1)
        )
    }
}

// MARK: - Preview

#Preview {
    OTPTextField.stub()
}
