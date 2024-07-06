//
//  OTPTextField.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.07.2024.
//

import SwiftUI

struct OTPTextField: View {
    
    // MARK: - Property Wrappers
    
    @State private var text: String
    @State private var activeFieldIndex: Int = 0
    @FocusState private var isCodeFocused: Bool
    @Binding private var code: String
    
    // MARK: - Private Properties
    
    @Binding private var type: ViewType
    private let fieldCount: Int
    private let fieldColor: Color
    private let errorText: String?
    private let isEnabled: Bool
    
    // MARK: - Initializers
    
    init(
        type: Binding<ViewType>,
        fieldCount: Int,
        fieldColor: Color,
        errorText: String?,
        isEnabled: Bool = true,
        code: Binding<String>
    ) {
        _type = type
        self.fieldCount = fieldCount
        self.fieldColor = fieldColor
        self.errorText = errorText
        self.isEnabled = isEnabled
        text = String("".prefix(fieldCount))
        _code = code
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 12) {
            fieldLabels
            errorLabel
        }
    }
}

// MARK: - UI Properties

private extension OTPTextField {
    @ViewBuilder
    private var fieldLabels: some View {
        HStack(spacing: Constants.stackSpacing) {
            ForEach(0 ..< fieldCount, id: \.self) { index in
                fieldLabel(with: index)
            }
        }
        .background(
            TextField("", text: $text)
                .keyboardType(.numberPad)
                .opacity(.zero)
                .focused($isCodeFocused)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            if isEnabled {
                isCodeFocused = true
                
                if type != .main {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        type = .main
                    }
                }
            }
        }
        .onChange(of: text) { newValue in
            updateText(with: newValue)
        }
        .padding(.top, 18)
        .padding(.horizontal, 36)
    }
    
    @ViewBuilder
    private var errorLabel: some View {
        Text(errorText ?? "")
            .foregroundStyle(AppColor.Text.red.color)
            .font(.montserratFont(size: 14, weight: .regular))
            .opacity(type == .error ? 1 : 0)
    }
}

// MARK: - Private methods

private extension OTPTextField {
    func fieldLabel(with index: Int) -> some View {
        var textCharacter: String = ""
        if text.count > index {
            let characterIndex = text.index(
                text.startIndex, offsetBy: index
            )
            
            textCharacter = String(text[characterIndex])
        }
        
        return Text(textCharacter)
            .otpTextField(
                with: type,
                size: Constants.size,
                color: fieldColor
            )
    }
    
    func updateText(with newValue: String) {
        text = Self.filteredText(newValue, limit: fieldCount)
        activeFieldIndex = text.count
        
        if text.count == fieldCount {
            isCodeFocused = false
        }
        
        code = text
    }
    
    static func filteredText(_ text: String, limit: Int) -> String {
        let filteredText = text.filter { "0123456789".contains($0) }
        return String(filteredText.prefix(limit))
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
            type: .constant(.main),
            fieldCount: 4,
            fieldColor: .red,
            errorText: AppString.Authorization.incorrectPassword,
            code: .constant("")
        )
    }
}

// MARK: - Preview

#Preview {
    OTPTextField.stub()
}
