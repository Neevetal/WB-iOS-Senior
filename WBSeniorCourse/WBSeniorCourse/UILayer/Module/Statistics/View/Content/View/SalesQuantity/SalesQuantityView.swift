//
//  SalesQuantityView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI
import Charts

struct YearKPISales {
    let salesKPI: Int
}

struct SalesYear: Identifiable {
    var id = UUID()
    let months: [SalesMonth]
    let color: Color
    let name: String
    
    static func mock2023() -> Self {
        return .init(
            months: [
                .init(name: "Янв", salesCount: 150),
                .init(name: "Фев", salesCount: 180),
                .init(name: "Мар", salesCount: 320),
                .init(name: "Апр", salesCount: 120),
                .init(name: "Май", salesCount: 250),
                .init(name: "Июнь", salesCount: 350),
                .init(name: "Июль", salesCount: 390),
                .init(name: "Авг", salesCount: 450),
                .init(name: "Сен", salesCount: 320),
                .init(name: "Окт", salesCount: 280),
                .init(name: "Ноя", salesCount: 210),
                .init(name: "Дек", salesCount: 150),
            ],
            color: .green, name: "2023"
        )
    }
    
    static func mock2024() -> Self {
        return .init(
            months: [
                .init(name: "Янв", salesCount: 250),
                .init(name: "Фев", salesCount: 280),
                .init(name: "Мар", salesCount: 420),
                .init(name: "Апр", salesCount: 520),
                .init(name: "Май", salesCount: 480),
                .init(name: "Июнь", salesCount: 350),
                .init(name: "Июль", salesCount: 320),
                .init(name: "Авг", salesCount: 280),
                .init(name: "Сен", salesCount: 320),
                .init(name: "Окт", salesCount: 400),
                .init(name: "Ноя", salesCount: 450),
                .init(name: "Дек", salesCount: 570),
            ],
            color: .red, name: "2024"
        )
    }
}

struct SalesMonth: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let salesCount: Int
}

struct SalesQuantityView: View {
    
    // MARK: - Properties
    
    private let data = [SalesYear.mock2023(), SalesYear.mock2024()]
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        titleLabel
                        percentageSalesLabel
                        chartView
                            .frame(minWidth: 64 * 12, maxWidth: .infinity)
                            .frame(height: 445)
                            .fixedSize(horizontal: false, vertical: false)
                    }
                    .padding(24)
                }
                .disableBounces()
            }
            .cornerRadius(28)
    }
}

// MARK: - UI Properties

private extension SalesQuantityView {
    @ViewBuilder
    var titleLabel: some View {
        Text(AppString.Statistics.SalesQuantity.title)
            .foregroundColor(AppColor.Text.White.main.color)
            .font(.montserratFont(size: 18, weight: .semiBold))
    }
    
    @ViewBuilder
    var percentageSalesLabel: some View {
        Text(
            AppString.Statistics.SalesQuantity.percentageOfSales(53)
            + " "
            + AppString.Statistics.SalesQuantity.comparedLastYear
        )
        .foregroundColor(AppColor.Text.White.main.color)
        .font(.montserratFont(size: 14, weight: .regular))
        .padding(.top, 6)
    }
    
    @ViewBuilder
    var chartView: some View {
        Chart(data) { year in
            ForEach(year.months, id: \.name) { month in
                AreaMark(
                    x: .value("Month", month.name),
                    y: .value("Values", month.salesCount),
                    stacking: .unstacked
                )
                .foregroundStyle(by: .value("year", year.name))
                .interpolationMethod(.catmullRom)
                
                LineMark(
                    x: .value("Month", month.name),
                    y: .value("Values", month.salesCount)
                )
                .interpolationMethod(.catmullRom)
                .lineStyle(StrokeStyle(lineWidth: 3))
                .foregroundStyle(.blue)
            }
        }
        .chartLegend(.hidden)
        .chartXAxis {
            AxisMarks(position: .bottom, values: .automatic) { value in
                AxisValueLabel() {
                    if let value = value.as(String.self) {
                        Text("\(value)")
                            .foregroundStyle(Color.white)
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading, values: .automatic) { value in
                AxisValueLabel() {
                    if let value = value.as(Int.self) {
                        Text("\(value)")
                            .foregroundStyle(Color.white)
                    }
                }
            }
        }
        .chartForegroundStyleScale(
            range: Gradient(colors: [.yellow, .green])
        )
        .padding(.top, 24)
    }
}

// MARK: - Accessibility

//extension SalesQuantityView: AXChartDescriptorRepresentable {
//    func makeChartDescriptor() -> AXChartDescriptor {
//        let min = data.map(\.uvIndex).min() ?? 0
//        let max = data.map(\.uvIndex).max() ?? 0
//
//        // A closure that takes a date and converts it to a label for axes
//        let dateTupleStringConverter: (((date: Date, uvIndex: Int)) -> (String)) = { dataPoint in
//            dataPoint.date.formatted(date: .omitted, time: .standard)
//        }
//        
//        let xAxis = AXCategoricalDataAxisDescriptor(
//            title: "Time of day",
//            categoryOrder: data.map { dateTupleStringConverter($0) }
//        )
//
//        let yAxis = AXNumericDataAxisDescriptor(
//            title: "UV Index value",
//            range: Double(min)...Double(max),
//            gridlinePositions: []
//        ) { value in "\(Int(value))" }
//
//        let series = AXDataSeriesDescriptor(
//            name: "UV Index",
//            isContinuous: true,
//            dataPoints: data.map {
//                .init(x: dateTupleStringConverter($0), y: Double($0.uvIndex))
//            }
//        )
//
//        return AXChartDescriptor(
//            title: "UV Index",
//            summary: nil,
//            xAxis: xAxis,
//            yAxis: yAxis,
//            additionalAxes: [],
//            series: [series]
//        )
//    }
//}

// MARK: - Preview

#Preview {
    SalesQuantityView()
}
