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
    
    // MARK: - Properties
    
    private var isError: Bool
    private let errorText: String
    
    // MARK: - Initialization and deinitialization
    
    init(
        phoneNumber: Binding<String>,
        isError: Bool,
        errorText: String
    ) {
        _phoneNumber = phoneNumber
        self.isError = isError
        self.errorText = errorText
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            errorLabel
            ZStack(alignment: .trailing) {
                textField
                clearButton
            }
        }
    }
}

// MARK: - UI Properties

private extension PhoneTextField {
    @ViewBuilder
    private var textField: some View {
        TextField("", text: $text)
            .accentColor(AppColor.Background.White.main.color)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
            .keyboardType(.numberPad)
            .focused($isFocused)
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        AppColor.Background.red.color,
                        lineWidth: isError ? 1 : 0
                    )
            )
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(AppColor.Background.White.main08.color)
            )
            .onChange(of: text) { newValue in
                formatMask(Constants.phoneMask, input: newValue)
                filterPhone(text: newValue)
                print("text", text)
                print("phoneNumber", phoneNumber)
            }
    }
    
    @ViewBuilder
    private var clearButton: some View {
        Image(systemName: Constants.xmarkImageName)
            .foregroundColor(AppColor.Background.White.main.color)
            .onTapGesture {
                clear()
            }
            .frame(width: 16, height: 16)
            .padding(.trailing, 16)
            .opacity(text == "" ? 0 : 1)
    }
    
    @ViewBuilder
    private var errorLabel: some View {
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
            print("index", index)
            let maskCharacterIndex = String.Index(utf16Offset: index, in: mask)
            let maskCharacter = mask[maskCharacterIndex]
            print("maskCharacterIndex", maskCharacterIndex)
            print("maskCharacter", maskCharacter)
            
            guard let firstInputCharacter = inputArray.first else {
                print("break")
                break
            }
            
            print("firstInputCharacter", firstInputCharacter)
            
            if (maskCharacter == firstInputCharacter || maskCharacter == "_") {
                result.append(firstInputCharacter)
                inputArray.removeFirst()
            } else {
                result.append(maskCharacter)
            }
            
            print(" ")
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
    }
}

// MARK: - Nested types

extension PhoneTextField {
    enum Constants {
        static let phoneMask: String = "+7 (___) ___ - __ - __"
        static let xmarkImageName: String = "xmark.circle.fill"
        static let errorAnimation: Animation = .easeInOut(duration: 0.2)
    }
}

// MARK: - Stubable

extension PhoneTextField: Stubable {
    @State static var phoneNumber = ""
    
    static func stub() -> PhoneTextField {
        PhoneTextField(
            phoneNumber: PhoneTextField.$phoneNumber,
            isError: false,
            errorText: AppString.Authorization.incorrectNumberFormat
        )
    }
}

// MARK: - Preview

#Preview {
    PhoneTextField.stub()
        .padding()
}
