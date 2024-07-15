//
//  LocalizationManager.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import SwiftUI

final class LocalizationManager: ObservableObject {
    
    // MARK: - Property Wrappers
    
    @AppStorage(AppStorageKey.selectedLanguage) private(set) var languageString: String = Language.russian.rawValue
    @Published public var language: Language = .russian {
        didSet {
            languageString = language.rawValue
            UserDefaults.standard.set([language.rawValue], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }
}

extension LocalizationManager {
    enum Language: String {
        case russian = "ru"
        case english = "en"
    }
}

extension String {
    func localized(_ language: LocalizationManager.Language) -> String {
        guard
            let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj"),
            let bundle = Bundle(path: path)
        else {
            print("Failed to find path for language: \(language.rawValue)")
            return self
        }
        
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
