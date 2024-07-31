//
//  InDevelopingView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 31.07.2024.
//

import SwiftUI

struct InDevelopingView: View {
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    // MARK: - Properties
    
    private var textFontSize: CGFloat {
        return horizontalSizeClass == .compact ? 24 : 48
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 40) {
            titleLabel
            iconImage
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

// MARK: - UI Properties

private extension InDevelopingView {
    @ViewBuilder
    private var titleLabel: some View {
        Text(AppString.Common.screenInDevelopment)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: textFontSize, weight: .semiBold))
    }
    
    @ViewBuilder
    private var iconImage: some View {
        Image(systemName: Constants.iconImageName)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .foregroundColor(AppColor.Text.White.main.color)
    }
}

// MARK: - Nested types

extension InDevelopingView {
    enum Constants {
        static let iconImageName: String = "exclamationmark.warninglight.fill"
    }
}

// MARK: - Preview

#Preview {
    InDevelopingView()
}
