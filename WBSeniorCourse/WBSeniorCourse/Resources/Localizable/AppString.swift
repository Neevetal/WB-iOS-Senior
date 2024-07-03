//
//  AppString.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 30.06.2024.
//

import Foundation

enum AppString {
    
    // MARK: - Authorization
    
    enum Authorization {
        static let authorization = "Авторизация"
        static let loginPhoneNumber = "Вход по номеру телефона"
        static let requestCode = "Запросить код"
        static var requestTheCodeAgain: (String) -> String = {
            return "Запросить код повторно через \($0) сек"
        }
        static let login = "Авторизоваться"
        static let comeBack = "Вернуться назад"
        static let incorrectPassword = "Неверный пароль"
    }
}
