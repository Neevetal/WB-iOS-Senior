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
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.navigationManager = NavigationManager()
        self.localizationManager = LocalizationManager()
        self.cargos = [
            .randomMock(),
            .randomMock(),
            nil
        ]
    }
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            CalculatorView()
        }
    }
}
