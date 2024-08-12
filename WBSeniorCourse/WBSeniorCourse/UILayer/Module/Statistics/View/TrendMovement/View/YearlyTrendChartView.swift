//
//  YearlyTrendChartView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI
import Charts

struct YearlyTrendChartView: View {
    
    // MARK: - Property Wrappers
    
    @Binding private var selectedTrend: Trend
    
    // MARK: - Properties
    
    private let trends: [Trend]
    
    // MARK: - Initialization and deinitialization
    
    init(with selectedTrend: Binding<Trend>) {
        trends = Trend.arrayMock()
        _selectedTrend = selectedTrend
    }
    
    // MARK: - Body
    
    var body: some View {
        Chart(trends) { trend in
            BarMark(
                x: .value("MonthId", trend.monthId),
                y: .value("Movie", trend.movie),
                width: 9
            )
            .cornerRadius(4)
            .foregroundStyle(
                selectedTrend.id == trend.id
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
                    isSelected: selectedTrend.id == trend.id
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
        Text("\(monthId)")
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
            let trand = trends.first(where: { $0.monthId == xbar })
        else {
            return
        }
        
        selectedTrend = trand
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
            YearlyTrendChartView(with: .constant(.mock()))
                .frame(width: 320, height: 200)
        }
    }
}

// MARK: - Preview

#Preview {
    YearlyTrendChartView.stub()
}
