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
                    VStack(alignment: .leading, spacing: 16) {
                        titleLabel
                        specialistsList
                    }
                    .padding(20)
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
        Text(AppString.Statistics.MarketingSpecialists.title)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
    
    @ViewBuilder
    private var specialistsList: some View {
        LazyVStack {
            ForEach(service.specialists, id: \.self) { specialist in
                MarketingSpecialistRow()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MarketingSpecialistsView()
}
