//
//  FontFamily.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 30.06.2024.
//

import SwiftUI

enum FontFamily {
    
    // MARK: - Montserrat
    
    enum Montserrat: String {
        case light = "Montserrat-Light"
        case regular = "Montserrat-Regular"
        case medium = "Montserrat-Medium"
        case semiBold = "Montserrat-SemiBold"
        case bold = "Montserrat-Bold"
    }
}

extension Font {
    static func montserratFont(size: CGFloat, weight: FontFamily.Montserrat) -> Font {
        return Font.custom(weight.rawValue, size: size)
    }
}
