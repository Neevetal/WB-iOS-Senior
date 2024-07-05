//
//  OTPTextField+ViewType.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 03.07.2024.
//

import SwiftUI

extension OTPTextField {
    enum ViewType {
        case main
        case error
        case succes
        
        var borderColor: Color {
            switch self {
            case .main:
                return .clear
            case .error:
                return AppColor.Background.red.color
            case .succes:
                return AppColor.Background.green.color
            }
        }
    }
}
