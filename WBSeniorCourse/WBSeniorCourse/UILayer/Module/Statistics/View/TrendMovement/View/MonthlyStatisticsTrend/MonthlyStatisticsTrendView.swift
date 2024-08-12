//
//  MonthlyStatisticsTrendView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct MonthlyStatisticsTrendView: View {
    
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
        .padding(.horizontal, 20)
    }
}

// MARK: - UI Properties

private extension MonthlyStatisticsTrendView {
    @ViewBuilder
    var titleLabel: some View {
        Text(AppString.Statistics.TrendMovement.statisticsForMonth(09))
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 16, weight: .medium))
            .padding(.top, 20)
    }
    
    @ViewBuilder
    var priceView: some View {
        CircleProgressRow(
            progress: .constant(0.6),
            model: .init(
                icon: .Asset.Statistics.Progress.priceIcon.image,
                title: AppString.Statistics.TrendMovement.price,
                value: "869$"
            )
        )
    }
    
    @ViewBuilder
    var clicksView: some View {
        CircleProgressRow(
            progress: .constant(0.24),
            model: .init(
                icon: .Asset.Statistics.Progress.clicksIcon.image,
                title: AppString.Statistics.TrendMovement.clicks,
                value: "24%"
            )
        )
    }
    
    @ViewBuilder
    var purchasesView: some View {
        CircleProgressRow(
            progress: .constant(0.9),
            model: .init(
                icon: .Asset.Statistics.Progress.purchasesIcon.image,
                title: AppString.Statistics.TrendMovement.purchases,
                value: "22 300"
            )
        )
    }
    
    @ViewBuilder
    var helpView: some View {
        CircleProgressRow(
            progress: .constant(0.01),
            model: .init(
                icon: .Asset.Statistics.Progress.helpIcon.image,
                title: AppString.Statistics.TrendMovement.help,
                value: "1,2%"
            )
        )
    }
}

// MARK: - Stubable

extension MonthlyStatisticsTrendView: Stubable {
    static func stub() -> any View {
        return ZStack {
            Color.black.opacity(0.8)
            MonthlyStatisticsTrendView()
                .frame(width: 320)
        }
    }
}

// MARK: - Preview

#Preview {
    MonthlyStatisticsTrendView.stub()
}
