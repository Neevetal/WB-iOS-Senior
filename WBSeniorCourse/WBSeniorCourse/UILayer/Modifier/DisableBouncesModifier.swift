//
//  DisableBouncesModifier.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 06.08.2024.
//

import SwiftUI

extension View {
    func disableBounces() -> some View {
        modifier(DisableBouncesModifier())
    }
}

struct DisableBouncesModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onAppear {
                UIScrollView.appearance().bounces = false
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true
            }
    }
}
