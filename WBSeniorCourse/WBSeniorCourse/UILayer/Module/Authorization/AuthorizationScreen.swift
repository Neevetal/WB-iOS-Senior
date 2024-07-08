//
//  AuthorizationScreen.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 08.07.2024.
//

import SwiftUI

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
            AuthorizationPhonePopupView(user: .init(initialValue: user), step: $step)
        case .code:
            AuthorizationCodePopupView(user: .init(initialValue: user), step: $step)
        case .loading:
            EmptyView()
        }
    }
}
