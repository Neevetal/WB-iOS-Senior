//
//  MonthlyStatisticsTrendView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct MonthlyStatisticsTrendView: View {
    
    // MARK: - Properties
    
    private let selectedTrend: Trend
    
    // MARK: - Initialization and deinitialization
    
    init(selectedTrend: Trend) {
        self.selectedTrend = selectedTrend
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            titleLabel
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 32) {
                    priceView
                    purchasesView
                }
                VStack(alignment: .leading, spacing: 32) {
                    clicksView
                    helpView
                }
            }
            .padding(.bottom, 16)
        }
    }
}

// MARK: - UI Properties

private extension MonthlyStatisticsTrendView {
    @ViewBuilder
    var titleLabel: some View {
        Text(AppString.Statistics.TrendMovement.statisticsForMonth(selectedTrend.monthId))
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
            .padding(.top, 20)
    }
    
    @ViewBuilder
    var priceView: some View {
        CircleProgressRow(
            progress: .constant(selectedTrend.info.priceValue),
            model: .init(
                icon: .Asset.Statistics.Progress.priceIcon.image,
                title: AppString.Statistics.TrendMovement.price,
                value: "\(selectedTrend.info.price)$"
            )
        )
    }
    
    @ViewBuilder
    var clicksView: some View {
        CircleProgressRow(
            progress: .constant(selectedTrend.info.clicksValue),
            model: .init(
                icon: .Asset.Statistics.Progress.clicksIcon.image,
                title: AppString.Statistics.TrendMovement.clicks,
                value: "\(selectedTrend.info.clicksPercent)%"
            )
        )
    }
    
    @ViewBuilder
    var purchasesView: some View {
        CircleProgressRow(
            progress: .constant(selectedTrend.info.purchasesValue),
            model: .init(
                icon: .Asset.Statistics.Progress.purchasesIcon.image,
                title: AppString.Statistics.TrendMovement.purchases,
                value: "\(selectedTrend.info.purchasesCount)"
            )
        )
    }
    
    @ViewBuilder
    var helpView: some View {
        CircleProgressRow(
            progress: .constant(selectedTrend.info.helpValue),
            model: .init(
                icon: .Asset.Statistics.Progress.helpIcon.image,
                title: AppString.Statistics.TrendMovement.help,
                value: "\(selectedTrend.info.helpPercent)%"
            )
        )
    }
}

// MARK: - Stubable

extension MonthlyStatisticsTrendView: Stubable {
    static func stub() -> any View {
        return ZStack {
            Color.black.opacity(0.8)
            MonthlyStatisticsTrendView(selectedTrend: .mock())
                .frame(width: 320)
        }
    }
}

// MARK: - Preview

#Preview {
    MonthlyStatisticsTrendView.stub()
}
