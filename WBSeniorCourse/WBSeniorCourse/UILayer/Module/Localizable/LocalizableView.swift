//
//  LocalizableView.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import SwiftUI

struct LocalizableView: View {
    
    // MARK: - Property Wrappers
    
    @EnvironmentObject private var localizationManager: LocalizationManager
    @State private var textKeys: [String] = [
        AppString.L10n.dog,
        AppString.L10n.cat,
        AppString.L10n.rabbit,
        AppString.L10n.fish
    ]
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(textKeys, id: \.self) { textKey in
                Text(textKey.localized(localizationManager.language))
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .padding(.top, 36)
        Spacer()
        Button(action: {
            localizationManager.language = localizationManager.language == .english
            ? .russian
            : .english
        }) {
            Text(AppString.L10n.changeLanguage.localized(localizationManager.language))
                .foregroundColor(.black)
        }
        .padding(.bottom, 36)
    }
}

// MARK: - Preview

#Preview {
    LocalizableView()
}
