//
//  StatisticsService.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 07.08.2024.
//

import SwiftUI

final class StatisticsService: ObservableObject {
    public let salesYears: [SalesYear] = [.mock2023(), .mock2024()]
    public let specialists: [MarketingSpecialist] = MarketingSpecialist.specialistsMock()
}
