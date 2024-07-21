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
    
    // MARK: - Initialization and deinitialization
    
    init() {
        self.navigationManager = NavigationManager()
    }
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            ContainerView()
        }
    }
}
