//
//  MarketingSpecialistsView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct MarketingSpecialistsView: View {
    
    // MARK: - Dependencies
    
    @EnvironmentObject private var service: StatisticsService
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(service.specialists, id: \.self) { specialist in
                            MarketingSpecialistRow()
                        }
                    }
                }
                .disableBounces()
            }
            .frame(height: 438)
            .cornerRadius(28)
    }
}

// MARK: - UI Properties

private extension MarketingSpecialistsView {
    @ViewBuilder
    private var titleLabel: some View {
        Text(AppString.Authorization.authorization)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 24, weight: .semiBold))
            .padding(.top, 40)
    }
}

// MARK: - Preview

#Preview {
    MarketingSpecialistsView()
}
