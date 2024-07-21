//
//  PopupView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.07.2024.
//

import SwiftUI

struct PopupView<Content>: View where Content: View {
    
    // MARK: - Properties
    
    private let content: Content
    
    // MARK: - Initialization and deinitialization
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                content
            }
            .frame(
                minWidth: 300,
                maxWidth: UIDevice.current.userInterfaceIdiom == .pad ? 400 : 300
            )
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(28)
    }
}

// MARK: - Preview

#Preview {
    PopupView<EmptyView>() {
        EmptyView()
    }
}
