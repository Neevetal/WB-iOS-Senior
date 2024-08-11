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
                    VStack(alignment: .leading, spacing: 0) {
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
    var titleLabel: some View {
        Text(AppString.Statistics.MarketingSpecialists.title)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
    
    @ViewBuilder
    var specialistsList: some View {
        LazyVStack(spacing: 0) {
            ForEach(service.specialists, id: \.self) { specialist in
                MarketingSpecialistRow(specialist: specialist)
                    .padding(.top, 12)
            }
        }
        .padding(.top, 4)
    }
}

// MARK: - Stubable

extension MarketingSpecialistsView: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            MarketingSpecialistsView()
                .environmentObject(StatisticsService())
        }
    }
}

// MARK: - Preview

#Preview {
    MarketingSpecialistsView.stub()
}
