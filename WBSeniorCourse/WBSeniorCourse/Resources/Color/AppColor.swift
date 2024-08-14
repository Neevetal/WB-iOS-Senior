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
        case blue = "blueBackgroundColor"
        case gray = "grayBackgroundColor"
        
        enum White: String {
            case main = "whiteBackgroundColor"
            case main04 = "whiteBackgroundColor04"
            case main08 = "whiteBackgroundColor08"
        }
        
        enum Purple: String {
            case main = "purpleBackgroundColor"
            case dark = "darkPurpleBackgroundColor"
        }
    }
    
    // MARK: - Text
    
    enum Text: String {
        enum White: String {
            case main = "whiteTextColor"
        }
        
        case red = "redTextColor"
        case gray = "grayTextColor"
        case green = "greenTextColor"
    }
    
    // MARK: - Shadow
    
    enum Shadow {
        enum White: String {
            case light = "white24ShadowColor"
        }
    }
    
    // MARK: - Gradient
    
    enum Gradient {
        case purple
        case darkPurple
        case blue
        case darkBlue
        case green
        
        var colorNames: [String] {
            switch self {
            case .purple: [
                "purple100GradientColor",
                "purple0GradientColor"
            ]
            case .darkPurple: [
                "darkPurple94GradientColor",
                "darkBlack49GradientColor"
            ]
            case .blue: [
                "blue56GradientColor",
                "blue0GradientColor"
            ]
            case .darkBlue: [
                "darkBlue74GradientColor",
                "darkBlue71GradientColor"
            ]
            case .green: [
                "green0GradientColor",
                "green100GradientColor"
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
