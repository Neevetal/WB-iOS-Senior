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
    
    init(numberOfFields: Int, color: Color) {
        self.numberOfFields = numberOfFields
        self.color = color
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0 ..< numberOfFields, id: \.self) { index in
                TextField("", text: $enterValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                .keyboardType(.numberPad)
                .frame(width: 64, height: 80)
                .background(color)
                .cornerRadius(5)
                .multilineTextAlignment(.center)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .onChange(of: enterValue[index]) { newValue in
                    if !newValue.isEmpty {
                        // Update to new value if there is already an value.
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            
                            // ADD THIS IF YOU DON'T HAVE TO HIDE THE KEYBOARD WHEN THEY ENTERED
                            // THE LAST VALUE.
                            // if oldValue.count == 0 {
                            //    enterValue[index] = String(enterValue[index].suffix(1))
                            //    return
                            // }
                            
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] = String(enterValue[index].suffix(1))
                            } else {
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        
                        // MARK: - Move to Next
                        if index == numberOfFields-1 {
                            // COMMENT IF YOU DON'T HAVE TO HIDE THE KEYBOARD WHEN THEY ENTERED
                            // THE LAST VALUE.
                            fieldFocus = nil
                        } else {
                            fieldFocus = (fieldFocus ?? 0) + 1
                        }
                    } else {
                        // MARK: - Move back
                        fieldFocus = (fieldFocus ?? 0) - 1
                    }
                }
            }
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

//#Preview {
//    OTPTextField.stub()
//}
