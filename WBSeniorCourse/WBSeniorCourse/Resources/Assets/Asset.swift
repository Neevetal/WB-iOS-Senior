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
            
            enum Background: String {
                case purpleBackgroundImage = "purpleBackgroundImage"
                case purpleBackgroundImagePNG = "purpleBackgroundImagePNG"
            }
            
            enum Chevron: String {
                case downIcon = "chevronDownIcon"
                case rightIcon = "chevronRightIcon"
            }
        }
        
        // MARK: - Authorization
        
        enum Authorization: String {
            case mailIcon = "mailIcon"
        }
        
        // MARK: - SideBar
        
        enum SideBar: String {
            case calendarIcon = "calendarIcon"
            case chartsIcon = "chartsIcon"
            case chatIcon = "chatIcon"
            case fireIcon = "fireIcon"
            case plusCircleIcon = "plusCircleIcon"
            case settingsIcon = "settingsIcon"
        }
        
        // MARK: - Statistics
        
        enum Statistics: String {
            case shareIcon = "shareIcon"
            case slidersIcon = "slidersIcon"
            case starIcon = "starIcon"
            case aiSupportBackground = "aiSupportBackground"
            case chartPin = "chartPin"
            
            enum Progress: String {
                case clicksIcon = "progressClicksIcon"
                case helpIcon = "progressHelpIcon"
                case priceIcon = "progressPriceIcon"
                case purchasesIcon = "progressPurchasesIcon"
            }
        }
        
        // MARK: - User
        
        enum User: String {
            case dog = "dogUserIcon"
            case cat = "catUserIcon"
            case man1 = "man1UserIcon"
            case man2 = "man2UserIcon"
            case man3 = "man3UserIcon"
            case man4 = "man4UserIcon"
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
