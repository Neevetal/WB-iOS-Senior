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
        ZStack {
            backgroundImage
            VStack(spacing: 12) {
                titleLabel
                helpButton
            }
        }
        .cornerRadius(28)
    }
}

// MARK: - UI Properties

private extension AISupportView {
    @ViewBuilder
    var backgroundImage: some View {
        Image(uiImage: .Asset.Statistics.aiSupportBackground.image)
            .resizable()
            .scaledToFill()
    }
    
    @ViewBuilder
    var titleLabel: some View {
        Text(AppString.Statistics.AISupport.title)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
    
    @ViewBuilder
    var helpButton: some View {
        Button(action: {}) {
            Text(AppString.Statistics.AISupport.helpIsNeeded)
                .foregroundColor(AppColor.Text.White.main.color)
                .font(.montserratFont(size: 12, weight: .regular))
                .padding(.vertical, 10.5)
                .padding(.horizontal, 12)
                .frame(height: 36)
                .background(
                    LinearGradient(
                        gradient: AppColor.Gradient.darkBlue.gradient,
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                    .cornerRadius(12)
                )
        }
    }
}

// MARK: - Preview

#Preview {
    AISupportView()
}
