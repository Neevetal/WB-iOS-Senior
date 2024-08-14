//
//  YearlyTrendChartView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI
import Charts

struct YearlyTrendChartView: View {
    
    // MARK: - Dependencies
    
    @EnvironmentObject private var service: StatisticsService
    
    // MARK: - Body
    
    var body: some View {
        Chart(service.trends) { trend in
            BarMark(
                x: .value("MonthId", trend.monthId),
                y: .value("Movie", trend.movie),
                width: 9
            )
            .clipShape(Capsule())
            .foregroundStyle(
                service.selectedTrend.id == trend.id
                ? AppColor.Background.blue.color
                : AppColor.Background.White.main.color
            )
            .annotation(
                position: .bottom,
                alignment: .bottom,
                spacing: 6
            ) {
                createAnnotationLabel(
                    with: trend.monthId,
                    isSelected: service.selectedTrend.id == trend.id
                )
            }
        }
        .padding(.top, 20)
        .chartOverlay { proxy in
            GeometryReader { geometry in
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(.clear)
                        .contentShape(Rectangle())
                        .onTapGesture { location in
                            doSelection(
                                at: location,
                                proxy: proxy,
                                geometry: geometry
                            )
                        }
                }
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
    }
}

// MARK: - UI Properties

private extension YearlyTrendChartView {
    @ViewBuilder
    func createAnnotationLabel(
        with monthId: Int,
        isSelected: Bool
    ) -> some View {
        Text(String(format: "%02d", monthId))
            .foregroundColor(
                isSelected
                ? AppColor.Text.White.main.color
                : AppColor.Text.gray.color
            )
            .font(.montserratFont(size: 12, weight: .medium))
    }
}

// MARK: - Private methods

private extension YearlyTrendChartView {
    func doSelection(
        at location: CGPoint,
        proxy: ChartProxy,
        geometry: GeometryProxy
    ) {
        let xPosition = location.x - geometry[proxy.plotAreaFrame].origin.x
        guard
            let xbar: Int = proxy.value(atX: xPosition),
            let trend = service.trends.first(where: { $0.monthId == xbar })
        else {
            return
        }
        
        service.selectedTrend = trend
    }
}

// MARK: - Stubable

extension YearlyTrendChartView: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            YearlyTrendChartView()
                .frame(width: 320, height: 200)
                .environmentObject(StatisticsService())
        }
    }
}

// MARK: - Preview

#Preview {
    YearlyTrendChartView.stub()
}
