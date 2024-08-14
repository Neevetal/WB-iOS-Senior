//
//  PhoneTextField.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct PhoneTextField: View {
    
    // MARK: - Property Wrappers
    
    @State private var text: String = ""
    @Binding private var phoneNumber: String
    @FocusState private var isFocused: Bool
    @Binding private var isError: Bool
    
    // MARK: - Properties
    
    private let mask: String
    private let errorText: String
    
    // MARK: - Initialization and deinitialization
    
    init(
        phoneNumber: Binding<String>,
        isError: Binding<Bool>,
        mask: String,
        errorText: String
    ) {
        _phoneNumber = phoneNumber
        _isError = isError
        self.mask = mask
        self.errorText = errorText
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    AppColor.Background.red.color,
                    lineWidth: isError ? 1 : 0
                )
                .background(AppColor.Background.White.main08.color)
            HStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 0) {
                    if isError {
                        errorLabel
                    }
                    textField
                }
                clearButton
            }
            .padding(.horizontal, 16)
        }
        .cornerRadius(12)
        .frame(height: 48)
        .onTapGesture {
            isFocused = true
            
            if isError {
                withAnimation(Constants.errorAnimation) {
                    isError = false
                }
            }
        }
    }
}

// MARK: - UI Properties

private extension PhoneTextField {
    @ViewBuilder
    var textField: some View {
        TextField("", text: $text)
            .accentColor(AppColor.Background.White.main.color)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
            .keyboardType(.numberPad)
            .focused($isFocused)
            .onChange(of: text) { newValue in
                formatMask(mask, input: newValue)
                filterPhone(text: newValue)
                
                if isError {
                    withAnimation(Constants.errorAnimation) {
                        isError = false
                    }
                }
            }
    }
    
    @ViewBuilder
    var clearButton: some View {
        Image(systemName: Constants.xmarkImageName)
            .foregroundColor(AppColor.Background.White.main.color)
            .onTapGesture {
                clear()
            }
            .frame(width: 16, height: 16)
            .opacity(text == "" ? 0 : 1)
    }
    
    @ViewBuilder
    var errorLabel: some View {
        Text(errorText)
            .foregroundColor(AppColor.Text.red.color)
            .font(.montserratFont(size: 12, weight: .medium))
    }
}

// MARK: - Private methods

private extension PhoneTextField {
    func formatMask(_ mask: String, input: String) {
        var inputArray = Array(input)
        var result: Array<Character> = []
        
        for index in 0 ..< mask.count {
            let maskCharacterIndex = String.Index(utf16Offset: index, in: mask)
            let maskCharacter = mask[maskCharacterIndex]
            
            guard let firstInputCharacter = inputArray.first
            else {
                break
            }
            
            if (maskCharacter == firstInputCharacter || maskCharacter == "_") {
                result.append(firstInputCharacter)
                inputArray.removeFirst()
            } else {
                result.append(maskCharacter)
            }
        }
        
        text = String(result)
    }
    
    func filterPhone(text: String) {
        phoneNumber = text.filter { "0123456789+".contains($0) }
        isFocused = phoneNumber.count != 12
    }
    
    func clear() {
        text = ""
        phoneNumber = ""
        
        if isError {
            withAnimation(Constants.errorAnimation) {
                isError = false
            }
        }
    }
}

// MARK: - Nested types

private extension PhoneTextField {
    enum Constants {
        static let xmarkImageName: String = "xmark.circle.fill"
        static let errorAnimation: Animation = .easeInOut(duration: 0.2)
    }
}

// MARK: - Stubable

extension PhoneTextField: Stubable {
    @State static var phoneNumber = ""
    
    static func stub() -> any View {
        PhoneTextField(
            phoneNumber: PhoneTextField.$phoneNumber,
            isError: .constant(false),
            mask: "+7 (___) ___ - __ - __",
            errorText: AppString.Authorization.incorrectNumberFormat
        )
        .padding()
    }
}

// MARK: - Preview

#Preview {
    PhoneTextField.stub()
        
}
