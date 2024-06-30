//
//  Asset.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 30.06.2024.
//

import UIKit

extension UIImage {
    enum Asset: String {
        case appIcon = "AppIcon"
        
        // MARK: - Authorization
        
        enum Common: String {
            case noPhotoIcon = "noPhotoIcon"
        }
        
        // MARK: - Authorization
        
        enum Authorization: String {
            case profileIcon = "profileIcon"
            case mailIcon = "mailIcon"
        }
    }
}

// MARK: - Protection

extension RawRepresentable where RawValue == String {
    var image: UIImage {
        guard let image = UIImage(
            named: rawValue,
            in: Bundle.main,
            compatibleWith: nil
        ) else {
            #if DEBUG
            fatalError("---- Картинка пустая: \(self.rawValue) ----")
            #else
            debugPrint("---- Картинка пустая: \(self.rawValue) ----")
            return UIImage()
            #endif
        }
        
        return image
    }
}
