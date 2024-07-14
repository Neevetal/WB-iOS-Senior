//
//  MockNavigationRootView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import SwiftUI

struct MockNavigationView: View {
    
    // MARK: - Property Wrappers
    
    @EnvironmentObject private var navigationManager: NavigationManager
    
    // MARK: - Properties
    
    private let titleText: String
    private let color: Color
    
    // MARK: - Initialization and deinitialization
    
    init(titleText: String, color: Color) {
        self.titleText = titleText
         self.color = color
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.title)
                .multilineTextAlignment(.center)
            Text("Количество экранов в стеке\n \(navigationManager.screens.count)")
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            Button(action: {
                let newView = AnyView(MockNavigationView(
                    titleText: "After push transition",
                    color: .red
                ))
                withAnimation {
                    navigationManager.push(newView)
                }
            }) {
                Text("Push transition")
                    .foregroundColor(.white)
            }
            Button(action: {
                let newView = AnyView(MockNavigationView(
                    titleText: "After present transition",
                    color: .blue
                ))
                withAnimation {
                    navigationManager.present(newView)
                }
            }) {
                Text("Present transition")
                    .foregroundColor(.white)
            }
            Button(action: {
                let newView = AnyView(MockNavigationView(
                    titleText: "After custom transition",
                    color: .green
                ))
                withAnimation {
                    navigationManager.custom(newView)
                }
            }) {
                Text("Custom transition")
                    .foregroundColor(.white)
            }
            .padding(.bottom, 12)
            
            if navigationManager.screens.count > 0 {
                Button(action: {
                    withAnimation {
                        navigationManager.pop()
                    }
                }) {
                    Text("Pop")
                        .foregroundColor(.white)
                }
                Button(action: {
                    withAnimation {
                        navigationManager.popToRoot()
                    }
                }) {
                    Text("Pop to Root")
                        .foregroundColor(.white)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .edgesIgnoringSafeArea(.all)
    }
}
