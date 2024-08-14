//
//  NavigationView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import SwiftUI

struct NavigationView<Content: View>: View {
    
    // MARK: - Property Wrappers
    
    @ObservedObject private var navigationManager: NavigationManager
    
    // MARK: - Properties
    
    private let rootView: Content
    
    // MARK: - Initialization and deinitialization
    
    init(
        navigationManager: NavigationManager,
        rootView: Content
    ) {
        self.navigationManager = navigationManager
        self.rootView = rootView
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            rootView
                .zIndex(0)
            
            ForEach(Array(navigationManager.screens.enumerated()), id: \.offset) { index, screen in
                ZStack(alignment: .top) {
                    if screen.showsBackButton && index == navigationManager.screens.count - 1 {
                        HStack {
                            backButton
                            Spacer()
                        }
                        .zIndex(Double(index + 2))
                    }
                    screen
                        .view
                        .zIndex(Double(index + 1))
                }
                .transition(self.transition(for: screen.type))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - UI Properties

private extension NavigationView {
    @ViewBuilder
    var backButton: some View {
        Button(action: {
            withAnimation {
                navigationManager.pop()
            }}
        ) {
            Image(systemName: Constants.backImageName)
                .foregroundColor(.white)
                .font(.title)
                .padding()
        }
    }
}

// MARK: - Private methods

private extension NavigationView {
    func transition(for type: NavigationType) -> AnyTransition {
        switch type {
        case .push:
            return .move(edge: .trailing)
        case .present:
            return .opacity
        case .custom:
            return .scale
        }
    }
}

// MARK: - Nested types

private extension NavigationView {
    enum Constants {
        static var backImageName: String { "chevron.left" }
    }
}
