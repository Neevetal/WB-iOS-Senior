//
//  ContentTrendMovementView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 08.08.2024.
//

import SwiftUI

struct ContentTrendMovementView: View {
    
    // MARK: - Properties
    
    @State private var selectedTrend: Trend
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.selectedTrend = .mock()
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                titleLabel
                YearlyTrendChartView(with: $selectedTrend)
                MonthlyStatisticsTrendView(selectedTrend: selectedTrend)
                ContactDetailsTrendView()
            }
            .padding(.horizontal, 20)
        }
        .disableBounces()
    }
}

// MARK: - UI Properties

private extension ContentTrendMovementView {
    @ViewBuilder
    var titleLabel: some View {
        Text(AppString.Statistics.TrendMovement.title(2024))
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
            .padding(.top, 36)
    }
}

// MARK: - Stubable

extension ContentTrendMovementView: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            ContentTrendMovementView()
                .environmentObject(StatisticsService())
        }
    }
}

// MARK: - Preview

#Preview {
    ContentTrendMovementView.stub()
}
