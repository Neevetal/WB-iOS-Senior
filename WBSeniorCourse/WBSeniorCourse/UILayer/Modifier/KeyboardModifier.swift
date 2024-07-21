//
//  KeyboardModifier.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 05.07.2024.
//

import SwiftUI

struct HideKeyboardOnTapModifier: ViewModifier {
    static func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {}
                .onLongPressGesture(
                    pressing: { isPressed in
                        if isPressed {
                            Self.hideKeyboard()
                        }
                    }, perform: {}
                )
            content
        }
    }
}

extension View {
    func endEditing() {
        HideKeyboardOnTapModifier.hideKeyboard()
    }
    
    func hideKeyboardOnTap() -> some View {
        ModifiedContent(content: self, modifier: HideKeyboardOnTapModifier())
    }
}
