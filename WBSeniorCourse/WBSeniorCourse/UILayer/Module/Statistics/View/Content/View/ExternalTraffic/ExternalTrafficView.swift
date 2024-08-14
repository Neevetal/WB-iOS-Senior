//
//  ExternalTrafficView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI

struct ExternalTrafficView: View {
    
    // MARK: - Dependencies
    
    @EnvironmentObject private var service: StatisticsService
    
    // MARK: - Property Wrappers
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var selectedMonth: MonthItem
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.selectedMonth = MonthItem.current
    }
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(
                    alignment: horizontalSizeClass == .compact 
                    ? .center
                    : .leading,
                    spacing: 24
                ) {
                    HStack(alignment: .top) {
                        titleLabel
                        Spacer()
                        MonthPicker(item: $selectedMonth)
                            .onChange(of: selectedMonth) { value in
                                service.updateSelectedExternalTraffic(with: value.id)
                            }
                    }
                    infoRfefefefows
                }
                .padding(20)
            }
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
    var infoRfefefefows: some View {
        switch horizontalSizeClass {
        case .compact:
            VStack(spacing: 16) {
                circleProgressView
                Spacer()
                infoRows
            }
        case .regular:
            HStack(spacing: 16) {
                circleProgressView
                Spacer()
                infoRows
            }
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    var circleProgressView: some View {
        PercentageCircleProgressView(
            progress: .constant(service.selectedExternalTraffic.purchasesValue)
        )
        .frame(width: 190, height: 190)
    }
    
    @ViewBuilder
    var infoRows: some View {
        VStack(spacing: 12) {
            TwoLabelsView(
                titleText: AppString.Statistics.ExternalTraffic.countOfPersons(
                    service.selectedExternalTraffic.newClientsCount
                ),
                commentText: AppString.Statistics.ExternalTraffic.newClients
            )
            TwoLabelsView(
                titleText: AppString.Statistics.ExternalTraffic.countOfPersons(
                    service.selectedExternalTraffic.clientsCount
                ),
                commentText: AppString.Statistics.ExternalTraffic.totalFromExternalTraffic
            )
        }
    }
}

// MARK: - Stubable

extension ExternalTrafficView: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            ExternalTrafficView()
                .environmentObject(StatisticsService())
        }
    }
}

// MARK: - Preview

#Preview {
    ExternalTrafficView.stub()
}
