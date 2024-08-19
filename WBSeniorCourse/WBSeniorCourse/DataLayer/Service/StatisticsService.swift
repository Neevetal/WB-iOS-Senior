//
//  StatisticsService.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 07.08.2024.
//

import SwiftUI
import VtexAPI

final class StatisticsService: ObservableObject {
    
    // MARK: - Property Wrappers
    
    @Published public var selectedExternalTraffic: ExternalTraffic
    @Published public var selectedTrend: Trend
    @Published public var products: [Product] = []
    
    // MARK: - Properties
    
    public let salesYears: [SalesYear] = SalesYear.arrayMock()
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

// MARK: - API

extension StatisticsService {
    func getProducts(limit: Int) {
        DefaultAPI.getProducts(limit: limit) { [weak self] products, error in
            guard let self, let products else { return }
            self.products = products
            print("data", products)
            print("error", error)
        }
    }
}
