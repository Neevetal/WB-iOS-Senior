//
//  SalesQuantityView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 20.07.2024.
//

import SwiftUI
import Charts

struct SalesQuantityView: View {
    
    // MARK: - Dependencies
    
    @EnvironmentObject private var service: StatisticsService
    
    // MARK: - Property Wrappers
    
    @State private var selectedXMonth: SalesMonth?
    @State private var salesDifference: Int = 0
    
    // MARK: - Body
    
    var body: some View {
        GradientView(
            gradient: AppColor.Gradient.darkPurple.gradient,
            points: (.leading, .trailing)) {
                VStack(alignment: .leading, spacing: 0) {
                    titleLabel
                    percentageSalesLabel
                    ScrollView(.horizontal, showsIndicators: false) {
                        chartView
                    }
                    .disableBounces()
                }
                .padding(24)
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
        HStack(spacing: 0) {
            Text(
                "\(salesDifference > 0 ? "+" : "")"
                + AppString.Statistics.SalesQuantity.percentageOfSales(salesDifference)
                + " "
            )
            .foregroundColor(
                salesDifference > 0
                ? AppColor.Text.green.color
                : AppColor.Text.red.color
            )
            
            Text(AppString.Statistics.SalesQuantity.comparedLastYear)
                .foregroundColor(AppColor.Text.White.main.color)
        }
        .font(.montserratFont(size: 14, weight: .regular))
        .opacity(salesDifference == 0 ? 0 : 1)
        .padding(.top, 6)
    }
    
    @ViewBuilder
    var chartView: some View {
        Chart {
            ForEach(service.products, id: \.id) { product in
                AreaMark(
                    x: .value("Month2023", product.id),
                    y: .value("Values2023", product.price),
                    stacking: .unstacked
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(LinearGradient(
                    gradient: AppColor.Gradient.blue.gradient,
                    startPoint: .top,
                    endPoint: .bottom
                ))
                
                LineMark(
                    x: .value("Month2023", product.id),
                    y: .value("Values2023", product.price)
                )
                .foregroundStyle(AppColor.Background.blue.color)
                .interpolationMethod(.catmullRom)
                .lineStyle(StrokeStyle(lineWidth: 3))
            }
            .foregroundStyle(by: .value("Type", "Values2023"))
        }
        .chartLegend(.hidden)
        .chartXAxis {
            AxisMarks(position: .bottom) { value in
                AxisValueLabel {
                    if let value = value.as(String.self) {
                        Text(value.capitalized)
                            .foregroundStyle(AppColor.Text.gray.color)
                            .padding(.top, 16)
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks(
                position: .leading,
                values: [0, 50, 100, 150, 200]
            ) { value in
                AxisGridLine(
                    centered: true,
                    stroke: StrokeStyle(dash: [4.0, 4.0])
                )
                .foregroundStyle(AppColor.Background.gray.color)
                AxisValueLabel {
                    if let value = value.as(Int.self) {
                        Text("\(value)")
                            .foregroundStyle(AppColor.Text.gray.color)
                            .frame(width: 40)
                            .padding(.trailing, 16)
                    }
                }
            }
        }
        .chartYScale(domain: 0...200)
        .frame(width: 68 * 12)
        .padding(.top, 24)
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
    }
}

// MARK: - Private methods

private extension SalesQuantityView {
    func doSelection(
        at location: CGPoint,
        proxy: ChartProxy,
        geometry: GeometryProxy
    ) {
        let xPosition = location.x - geometry[proxy.plotAreaFrame].origin.x
        guard
            let xbar: String = proxy.value(atX: xPosition),
            let month = service.salesYears[1].months.first(where: { $0.name == xbar })
        else {
            return
        }
        
        selectedXMonth = month
        getSalesDifference()
    }
    
    func getSalesDifference() {
        guard
            let value = selectedXMonth?.salesCount,
            let month = service.salesYears[0].months.first(
                where: { $0.name == selectedXMonth?.name }
            ) else {
            return
        }
        
        let result: Int = Int((Double(value) / Double(month.salesCount)) * 100 - 100)
        salesDifference = result
    }
}

// MARK: - Stubable

extension SalesQuantityView: Stubable {
    static func stub() -> any View {
        return ZStack {
            LinearGradient(
                gradient: AppColor.Gradient.darkPurple.gradient,
                startPoint: .top,
                endPoint: .bottom
            )
            SalesQuantityView()
                .environmentObject(StatisticsService())
        }
    }
}

// MARK: - Preview

#Preview {
    SalesQuantityView.stub()
}
