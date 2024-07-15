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
    @State private var formattedDates: [String] = []
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16) {
            L10nView
            formattedDatesView
        }
        .onAppear {
            formattedDates = [
                formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .short),
                formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .medium),
                formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .long)
            ]
        }
    }
}

// MARK: - UI Properties

private extension LocalizableView {
    @ViewBuilder
    private var L10nView: some View {
        VStack(spacing: 8) {
            ForEach(textKeys, id: \.self) { textKey in
                Text(textKey.localized(localizationManager.language))
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .padding(.top, 36)
        Button(action: {
            localizationManager.language = localizationManager.language == .english
            ? .russian
            : .english
            
            formattedDates = [
                formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .short),
                formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .medium),
                formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .long)
            ]
        }) {
            Text(AppString.L10n.changeLanguage.localized(localizationManager.language))
                .foregroundColor(.blue)
        }
        .padding(.vertical, 16)
    }
    
    @ViewBuilder
    private var formattedDatesView: some View {
        VStack(spacing: 8) {
            Text(AppString.L10n.dates.localized(localizationManager.language))
                .font(.title)
                .padding(.bottom, 12)
            ForEach(formattedDates, id: \.self) { date in
                Text(date)
                    .font(.body)
            }
        }
        .foregroundColor(.black)
        Spacer()
    }
}

// MARK: - Private methods

private extension LocalizableView {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
    
    func formattedCurrentDate(languageCode: String, style: DateFormatter.Style) -> String {
        let languageLocale = Locale(identifier: languageCode)
        LocalizableView.dateFormatter.locale = Locale(identifier: "\(languageCode)_\(Locale.current.region?.identifier ?? "US")")
        
        LocalizableView.dateFormatter.dateStyle = style
        LocalizableView.dateFormatter.timeStyle = style
        let currentDate = Date()
        return LocalizableView.dateFormatter.string(from: currentDate)
    }
}

// MARK: - Preview

#Preview {
    LocalizableView()
}
