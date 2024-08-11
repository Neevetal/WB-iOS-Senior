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
    @State private var distanceInMeters: Double = 1000
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16) {
            L10nView
            formattedDatesView
            unitsView
        }
        .hideKeyboardOnTap()
        .onAppear {
            updateFormattedDates()
        }
    }
}

// MARK: - UI Properties

private extension LocalizableView {
    @ViewBuilder
    var L10nView: some View {
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
            updateFormattedDates()
        }) {
            Text(AppString.L10n.changeLanguage.localized(localizationManager.language))
                .foregroundColor(.blue)
        }
        .padding(.vertical, 16)
    }
    
    @ViewBuilder
    var formattedDatesView: some View {
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
    
    @ViewBuilder
    var unitsView: some View {
        VStack(spacing: 8) {
            Text(AppString.L10n.distance.localized(localizationManager.language))
                .font(.title)
            TextField("", value: $distanceInMeters, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)
            Text("\(FormattedManager.formattedDistance(distanceInMeters, languageCode: localizationManager.language.rawValue, unit: .kilometers))")
            Text("\(FormattedManager.formattedDistance(distanceInMeters, languageCode: localizationManager.language.rawValue, unit: .miles))")
            Spacer()
        }
        .padding()
    }
}

// MARK: - Private methods

private extension LocalizableView {
    func updateFormattedDates() {
        formattedDates = [
            FormattedManager.formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .short),
            FormattedManager.formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .medium),
            FormattedManager.formattedCurrentDate(languageCode: localizationManager.language.rawValue, style: .long)
        ]
    }
}

// MARK: - Stubable

extension LocalizableView: Stubable {
    static func stub() -> any View {
        return LocalizableView()
            .environmentObject(LocalizationManager())
    }
}

// MARK: - Preview

#Preview {
    LocalizableView.stub()
}
