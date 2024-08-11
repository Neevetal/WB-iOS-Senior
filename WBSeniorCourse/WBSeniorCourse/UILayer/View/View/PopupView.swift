//
//  PopupView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.07.2024.
//

import SwiftUI

struct PopupView<Content>: View where Content: View {
    
    // MARK: - Properties
    
    private var isLoading: Bool
    private let content: Content
    
    // MARK: - Initialization and deinitialization
    
    init(
        isLoading: Bool,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.isLoading = isLoading
        self.content = content()
    }
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                ZStack {
                    content
                        .opacity(isLoading ? 0 : 1)
                    if isLoading {
                        loader
                    }
                }
            }
            .frame(
                minWidth: 300,
                maxWidth: Constants.maxWidth
            )
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(28)
    }
}

// MARK: - UI Properties

private extension PopupView {
    @ViewBuilder
    var loader: some View {
        ProgressView()
            .tint(.white)
    }
}

// MARK: - Nested types

extension PopupView {
    enum Constants {
        static var maxWidth: CGFloat {
            return UIDevice.current.userInterfaceIdiom == .pad
            ? 400
            : 300
        }
    }
}

// MARK: - Stubable

extension PopupView: Stubable {
    static func stub() -> any View {
        return PopupView<EmptyView>(isLoading: false) {
            EmptyView()
        }
    }
}

// MARK: - Preview

#Preview {
    PopupView<EmptyView>.stub()
}
