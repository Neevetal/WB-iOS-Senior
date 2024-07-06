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
    @State private var type: ViewType = .main
    
    // MARK: - Private Properties
    
    private let fieldCount: Int
    private let fieldColor: Color
    private let errorText: String?
    private let isEnabled: Bool
    
    // MARK: - Initializers
    
    init(
        fieldCount: Int,
        fieldColor: Color,
        errorText: String?,
        isEnabled: Bool = true,
        code: Binding<String>
    ) {
        self.fieldCount = fieldCount
        self.fieldColor = fieldColor
        self.errorText = errorText
        self.isEnabled = isEnabled
        self.text = String("".prefix(fieldCount))
        _code = code
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 16) {
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
            }
        }
        .overlay {
            if let errorText = errorText {
                Text(errorText)
                    .foregroundStyle(AppColor.Text.red.color)
                    .font(.montserratFont(size: 14, weight: .regular))
                    .padding(.top, 110)
                    .padding(.horizontal, 16)
            }
        }
        .onChange(of: text) { newValue in
            updateText(with: newValue)
        }
    }
}

// MARK: - Private methods

private extension OTPTextField {
    func fieldLabel(with index: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(fieldColor)
            
            if text.count > index {
                let characterIndex = text.index(
                    text.startIndex, offsetBy: index
                )
                
                let textCharacter = String(text[characterIndex])
                
                Text(textCharacter)
                    .otpTextField(
                        with: type,
                        color: fieldColor
                    )
            }
        }
        .frame(width: Constants.size.width, height: Constants.size.height)
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
            fieldColor: AppColor.Background.White.main08.color,
            errorText: "Неверный пароль",
            code: .constant("")
        )
    }
}

// MARK: - Preview

#Preview {
    OTPTextField.stub()
}
