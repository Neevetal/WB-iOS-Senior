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
    @State private var showType: ShowType = .close
    @State private var xSideOffset: CGFloat = Constants.sideViewWidth
    @State private var contentSpacing: CGFloat = Constants.sideViewWidth
    
    // MARK: - Properties
    
    private let content: Content
    
    // MARK: - Initialization and deinitialization
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .trailing) {
            content
                .padding(
                    .trailing,
                    horizontalSizeClass == .compact
                    ? 0
                    : contentSpacing
                )
            sideView
        }
        .animation(.easeInOut, value: xSideOffset)
        .onAppear {
            showType = horizontalSizeClass == .compact
            ? .close
            : .open
            xSideOffset = showType.xSideOffset
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
                ContentTrendMovementView()
            }
            .frame(width: Constants.sideViewWidth)
            .cornerRadius(44, corners: [.topLeft, .bottomLeft])
            .offset(x: xSideOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if showType == .open {
                            if value.translation.width > 0 {
                                xSideOffset = min(Constants.sideViewWidth, value.translation.width)
                                contentSpacing = Constants.sideViewWidth - xSideOffset
                            }
                        } else {
                            if value.translation.width < 0 {
                                xSideOffset = max(0, Constants.sideViewWidth + value.translation.width)
                                contentSpacing = Constants.sideViewWidth - xSideOffset
                            }
                        }
                    }
                    .onEnded { value in
                        if showType == .open {
                            if value.translation.width > Constants.sideViewWidth / 2 {
                                closeSideView()
                            } else {
                                openSideView()
                            }
                        } else {
                            if value.translation.width < -(Constants.sideViewWidth / 2) {
                                openSideView()
                            } else {
                                closeSideView()
                            }
                        }
                    }
            )
            .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Private methods

private extension TrendMovementView {
    func openSideView() {
        showType = .open
        xSideOffset = showType.xSideOffset
        contentSpacing = Constants.sideViewWidth - xSideOffset
    }
    
    func closeSideView() {
        showType = .close
        xSideOffset = showType.xSideOffset
        contentSpacing = Constants.sideViewWidth - xSideOffset
    }
}

// MARK: - Nested types

extension TrendMovementView {
    enum ShowType {
        case open
        case close
        
        var xSideOffset: CGFloat {
            switch self {
            case .open:
                return 0
            case .close:
                return 300
            }
        }
    }
    
    enum Constants {
        static var sideViewWidth: CGFloat {
            return 320
        }
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
