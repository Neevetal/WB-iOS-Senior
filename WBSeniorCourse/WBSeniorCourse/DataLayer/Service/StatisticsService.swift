//
//  StatisticsService.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 07.08.2024.
//

import SwiftUI

final class StatisticsService: ObservableObject {
    
    // MARK: - Property Wrappers
    
    @Published public var selectedExternalTraffic: ExternalTraffic
    @Published public var selectedTrend: Trend
    
    // MARK: - Properties
    
    public let salesYears: [SalesYear] = [.mock2023(), .mock2024()]
    public let specialists: [MarketingSpecialist] = MarketingSpecialist.specialistsMock()
    public let externalTraffics: [ExternalTraffic] = ExternalTraffic.arrayMock()
    public let trends: [Trend] = Trend.arrayMock()
    
    // MARK: - Initialization and deinitialization
    
    init() {
        let monthIndex = MonthItem.current.id - 1
        self.selectedExternalTraffic = ExternalTraffic.arrayMock()[monthIndex]
        self.selectedTrend = Trend.arrayMock()[monthIndex]
    }
}

// MARK: - Public methods

extension StatisticsService {
    func updateSelectedExternalTraffic(with monthIndex: Int) {
        let index = monthIndex - 1
        selectedExternalTraffic = externalTraffics[index]
    }
}
