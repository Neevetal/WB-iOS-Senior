//
//  PhoneTextField.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

struct PhoneTextField: View {
    
    // MARK: - Properties
    
    @Binding private var phoneNumber: String
    @Binding private var isError: Bool
    
    // MARK: - Initialization and deinitialization
    
    init(phoneNumber: Binding<String>, isError: Binding<Bool>) {
        _phoneNumber = phoneNumber
        _isError = isError
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .trailing) {
            textField
            clearButton
        }
    }
}

// MARK: - UI Properties

private extension PhoneTextField {
    @ViewBuilder
    private var textField: some View {
        TextField("Привет", text: $phoneNumber)
            .accentColor(AppColor.Background.White.main.color)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
            .keyboardType(.numberPad)
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
                    .fill(.gray)
            )//AppColor.Background.White.main08.color))
            .onChange(of: phoneNumber) { newValue in
                print("newValue", newValue)
            }
    }
    
    @ViewBuilder
    private var clearButton: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(AppColor.Background.White.main.color)
            .onTapGesture {
                phoneNumber = ""
            }
            .frame(width: 16, height: 16)
            .padding(.trailing, 16)
            .opacity(phoneNumber == "" ? 0 : 1)
    }
}

// MARK: - Preview

extension PhoneTextField: Stubable {
    @State static var phoneNumber = ""
    @State static var isError = false
    
    static func stub() -> PhoneTextField {
        PhoneTextField(
            phoneNumber: PhoneTextField.$phoneNumber,
            isError: PhoneTextField.$isError
        )
    }
}

// MARK: - Preview

#Preview {
    PhoneTextField.stub()
        .padding()
}
