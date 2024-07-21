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
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.navigationManager = NavigationManager()
        self.localizationManager = LocalizationManager()
    }
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            LocalizableView()
                .environmentObject(localizationManager)
        }
    }
}
