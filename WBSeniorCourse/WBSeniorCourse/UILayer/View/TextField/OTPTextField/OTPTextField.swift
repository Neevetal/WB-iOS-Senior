//
//  OTPTextField.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.07.2024.
//

import SwiftUI

struct OTPTextField: View {
    
    // MARK: - Properties
    
    private let fieldCount: Int
    private let color: Color
    
    @FocusState private var fieldFocus: Int?
    @State private var enterValue: [String]
    @State private var oldValue = ""
    
    @Binding private var code: String
    @State private var type: ViewType = .main
    
    // MARK: - Initialization and deinitialization
    
    init(
        fieldCount: Int,
        color: Color,
        code: Binding<String>
    ) {
        self.fieldCount = fieldCount
        self.color = color
        _code = code
        self.enterValue = Array(repeating: "", count: fieldCount)
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Constants.stackSpacing) {
            ForEach(0 ..< fieldCount, id: \.self) { index in
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
                        
                        fieldFocus = index == fieldCount - 1
                        ? nil
                        : (fieldFocus ?? 0) + 1
                    } else {
                        fieldFocus = (fieldFocus ?? 0) - 1
                    }
                    
                    code = enterValue
                        .map { String($0) }
                        .joined(separator: "")
                }
            }
        }
        .padding(.top, 18)
        .padding(.bottom, Constants.bottomPadding)
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
        
        static var bottomPadding: CGFloat {
            let isIPad = UIDevice.current.userInterfaceIdiom == .pad
            return isIPad ? 30 : 18
        }
    }
}

// MARK: - Stubable

extension OTPTextField: Stubable {
    static func stub() -> OTPTextField {
        return OTPTextField(
            fieldCount: 4,
            color: .gray.opacity(0.1),
            code: .constant("")
        )
    }
}

// MARK: - Preview

#Preview {
    OTPTextField.stub()
}
