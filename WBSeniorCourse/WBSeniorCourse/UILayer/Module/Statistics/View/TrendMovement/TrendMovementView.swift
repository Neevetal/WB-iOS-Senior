//
//  TrendMovementView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct TrendMovementView<Content>: View where Content: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var offset: CGSize = .zero
    
    // MARK: - Properties
    
    private let content: Content
    private var sideSpacing: CGSize {
        return .init(
            width: horizontalSizeClass == .compact ? 300 : 0,
            height: 0
        )
    }
    
    // MARK: - Initialization and deinitialization
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 0) {
            content
            sideView
        }
        .onAppear {
            offset = sideSpacing
        }
    }
}

// MARK: - UI Properties

private extension TrendMovementView {
    @ViewBuilder
    private var sideView: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(spacing: 0) {}
            }
            .frame(width: 320)
            //.fixedSize(horizontal: true, vertical: false)
            .cornerRadius(44, corners: [.topLeft, .bottomLeft])
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        print("offset", offset)
                    }
                    .onEnded { _ in
                        if abs(offset.width) > 100 {
                            // remove the card
                        } else {
                            offset = .zero
                        }
                    }
            )
    }
}

// MARK: - Nested types

extension TrendMovementView {
    enum Constants {
        static var backImageName: String { "chevron.left" }
    }
}

// MARK: - Stubable

extension TrendMovementView: Stubable {
    static func stub() -> any View {
        return HStack(spacing: 0) {
            Spacer()
            TrendMovementView<EmptyView>() {}
        }
    }
}

// MARK: - Preview

#Preview {
    TrendMovementView<EmptyView>.stub()
}
