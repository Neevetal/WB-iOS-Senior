//
//  AppColor.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 30.06.2024.
//

import SwiftUI

enum AppColor {
    
    // MARK: - Background
    
    enum Background: String {
        case red = "redBackgroundColor"
        case green = "greenBackgroundColor"
        
        enum Purple: String {
            case main = "purpleBackgroundColor"
            case dark = "darkPurpleBackgroundColor"
        }
    }
    
    // MARK: - Text
    
    enum Text: String {
        case white = "whiteTextColor"
        case red = "redTextColor"
    }
    
    // MARK: - Gradient
    
    enum Gradient {
        case darkPurple
        
        var colorNames: [String] {
            switch self {
            case .darkPurple: [
                    "darkPurple94GradientColor",
                    "darkBlack49GradientColor"
                ]
            }
        }
    }
}

// MARK: - Protection

extension RawRepresentable where RawValue == String {
    var color: Color {
        guard UIColor(named: rawValue) != nil else {
            #if DEBUG
            fatalError("---- Цвет отсутствует: \(self.rawValue) ----")
            #else
            debugPrint("---- Цвет отсутствует: \(self.rawValue) ----")
            return Color()
            #endif
        }
        
        return Color(rawValue)
    }
}

extension AppColor.Gradient {
    var gradient: Gradient {
        let colors = colorNames.compactMap { colorName -> Color? in
            guard let _ = UIColor(named: colorName) else {
                print("---- Цвет градиента отсутствует: \(colorName) ----")
                return nil
            }
            
            return Color(colorName)
        }
        
        return Gradient(colors: colors)
    }
}
