//
//  ExternalTrafficView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct ExternalTrafficView: View {
    
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
            .frame(height: 280)
            .cornerRadius(28)
    }
}

// MARK: - UI Properties

private extension ExternalTrafficView {
    @ViewBuilder
    private var titleLabel: some View {
        Text(AppString.Statistics.ExternalTraffic.title)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
}

// MARK: - Preview

#Preview {
    ExternalTrafficView()
}
