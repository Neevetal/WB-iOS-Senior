//
//  AISupportView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct AISupportView: View {
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(alignment: .leading, spacing: 0) {
                    titleLabel
                }
                .padding(20)
            }
            .frame(height: 134)
            .cornerRadius(28)
    }
}

// MARK: - UI Properties

private extension AISupportView {
    @ViewBuilder
    private var titleLabel: some View {
        Text(AppString.Statistics.AISupport.title)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
}

// MARK: - Preview

#Preview {
    AISupportView()
}
