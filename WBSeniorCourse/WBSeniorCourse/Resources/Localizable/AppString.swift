//
//  AppString.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 30.06.2024.
//

import Foundation

enum AppString {
    
    // MARK: - Common
    
    enum Common {
        static let screenInDevelopment = "Экран в разработке"
    }
    
    // MARK: - Authorization
    
    enum Authorization {
        static let authorization = "Авторизация"
        static let loginPhoneNumber = "Вход по номеру телефона"
        static let requestCode = "Запросить код"
        static let incorrectNumberFormat = "Некорректный формат"
        static var requestTheCodeAgain: (String) -> String = {
            return "Запросить повторно через \($0) сек"
        }
        static let login = "Авторизоваться"
        static let comeBack = "Вернуться назад"
        static let incorrectPassword = "Неверный пароль"
    }
    
    // MARK: - Statistics
    
    enum Statistics {
        static let statistics = "Статистика"
        static let displayingWidgets = "Отображение виджетов"
        static let share = "Поделиться"
    }
    
    // MARK: - MultipeerConnectivity
    
    enum MultipeerConnectivity {
        static let connect = "Подключиться"
        static let disconnect = "Отключиться"
        static let sendMessage = "Отправить сообщении"
    }
    
    // MARK: - L10n
    
    enum L10n {
        static let dog = "Dog_L10n_Key"
        static let cat = "Cat_L10n_Key"
        static let rabbit = "Rabbit_L10n_Key"
        static let fish = "Fish_L10n_Key"
        static let changeLanguage = "СhangeLanguage_L10n_Key"
        static let dates = "Dates_L10n_Key"
        static let distance = "Distance_L10n_Key"
    }
}
