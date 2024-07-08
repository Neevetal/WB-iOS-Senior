//
//  WBSeniorCourseApp.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 29.06.2024.
//

import SwiftUI

@main
struct WBSeniorCourseApp: App {
    var body: some Scene {
        WindowGroup {
            AuthorizationScreen()
        }
    }
}

enum AuthorizationStep {
    case phone
    case code
    case loading
}

class User: ObservableObject {
    @Published var phone: String
    @Published var code: String
    
    init(phone: String, code: String) {
        self.phone = phone
        self.code = code
    }
    
    var isPhoneValid: Bool {
        phone.count == 12
    }
}

struct AuthorizationScreen: View {
    
    // MARK: - Property Wrappers
    
    @State private var step: AuthorizationStep = .phone
    @StateObject private var user: User = .init(phone: "", code: "")
    
    // MARK: - Body

    var body: some View {
        ZStack {
            BackgroundImageView(
                image: .Asset.Common.Background.purpleBackgroundImage.image,
                color: Color.black
            ) {
                currentPopup
            }
        }
    }
}

// MARK: - UI Properties

private extension AuthorizationScreen {
    @ViewBuilder
    private var currentPopup: some View {
        switch step {
        case .phone:
            AuthorizationPhoneScreen(user: .init(initialValue: user), step: $step)
        case .code:
            AuthorizationCodeScreen(user: .init(initialValue: user), step: $step)
        case .loading:
            EmptyView()
        }
    }
}
