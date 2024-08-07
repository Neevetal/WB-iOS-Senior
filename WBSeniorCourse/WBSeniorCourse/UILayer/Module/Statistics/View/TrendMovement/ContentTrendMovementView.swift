//
//  ContentTrendMovementView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 08.08.2024.
//

import SwiftUI

struct ContentTrendMovementView: View {
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                titleLabel
                YearlyTrendChartView()
                MonthlyStatisticsTrendView()
                ContacDetailsTrendView()
            }
        }
        .disableBounces()
    }
}

// MARK: - UI Properties

private extension ContentTrendMovementView {
    @ViewBuilder
    private var titleLabel: some View {
        Text(AppString.Statistics.TrendMovement.title(2024))
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
            .padding(.top, 36)
    }
}

// MARK: - Preview

#Preview {
    ContentTrendMovementView()
}
