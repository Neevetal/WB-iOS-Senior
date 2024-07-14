//
//  NavigationManager.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 14.07.2024.
//

import SwiftUI

final class NavigationManager: ObservableObject {
    @Published var screens: [Screen] = []
    
    func push(_ view: AnyView) {
        let screen = Screen(view: view, type: .push, showsBackButton: true)
        screens.append(screen)
    }
    
    func present(_ view: AnyView) {
        let screen = Screen(view: view, type: .present, showsBackButton: false)
        screens.append(screen)
    }
    
    func custom(_ view: AnyView) {
        let screen = Screen(view: view, type: .custom, showsBackButton: false)
        screens.append(screen)
    }
    
    func pop() {
        if !screens.isEmpty {
            screens.removeLast()
        }
    }
    
    func popToRoot() {
        screens.removeAll()
    }
}
