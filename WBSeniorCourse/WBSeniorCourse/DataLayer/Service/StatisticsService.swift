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
    @Published public var users: [MarketingSpecialist] = []
    
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

// MARK: - Private methods

private extension StatisticsService {
    func prepareUsers(from users: [VtexAPI.User]) {
        var result = [MarketingSpecialist]()
        let names = users.map {
            $0.name.firstname + " " + $0.name.lastname
        }
        
        let mock = MarketingSpecialist.specialistsMock()
        names.enumerated().forEach { index, name in
            var user = mock[index]
            user.name = name
            result.append(user)
        }
        
        self.users = result
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
        DefaultAPI.getProducts(limit: limit) { [weak self] products, _ in
            guard let self, let products else {
                return
            }
            
            print("products", products)
            self.products = products
        }
    }
    
    func getUsers(limit: Int) {
        DefaultAPI.getUsers(limit: limit) { [weak self] users, _ in
            guard let self, let users else {
                return
            }
            
            print("users", users)
            self.prepareUsers(from: users)
        }
    }
}
