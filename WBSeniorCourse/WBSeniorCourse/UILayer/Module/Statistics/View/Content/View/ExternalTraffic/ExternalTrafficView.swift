//
//  ExternalTrafficView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct ExternalTrafficView: View {
    
    // MARK: - Property Wrappers
    
    @State var selectedMonth: MonthItem
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.selectedMonth = MonthItem.current
    }
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .top) {
                        titleLabel
                        Spacer()
                        MonthPicker(item: $selectedMonth)
                    }
                    HStack(spacing: 16) {
                        circleProgressView
                        infoRows
                    }
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
    var titleLabel: some View {
        Text(AppString.Statistics.ExternalTraffic.title)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
    
    @ViewBuilder
    var circleProgressView: some View {
        PercentageCircleProgressView(progress: .constant(0.78))
            .frame(width: 190, height: 190)
    }
    
    @ViewBuilder
    var infoRows: some View {
        VStack(spacing: 12) {
            TwoLabelsView(
                titleText: "445 чел.",
                commentText: "Всего с внешнего трафика"
            )
            TwoLabelsView(
                titleText: "445 чел.",
                commentText: "Всего с внешнего трафика"
            )
        }
    }
}

// MARK: - Preview

#Preview {
    ExternalTrafficView()
}
