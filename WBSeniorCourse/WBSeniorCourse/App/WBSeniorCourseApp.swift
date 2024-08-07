//
//  WBSeniorCourseApp.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

@main
struct WBSeniorCourseApp: App {
    
    // MARK: - Dependencies
    
    private let navigationManager: NavigationManager
    private let localizationManager: LocalizationManager
    private let cargos: [Cargo?]
    private let mcUtilit: MCUtilit
    private let statisticsService: StatisticsService
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.navigationManager = NavigationManager()
        self.localizationManager = LocalizationManager()
        self.cargos = [
            .randomMock(),
            .randomMock(),
            nil
        ]
        self.mcUtilit = MCUtilit()
        self.statisticsService = StatisticsService()
    }
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            SideTabBarView()
                .environmentObject(statisticsService)
        }
    }
}
