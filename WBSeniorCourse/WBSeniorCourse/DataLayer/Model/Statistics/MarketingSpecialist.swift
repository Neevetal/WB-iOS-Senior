//
//  MarketingSpecialist.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 07.08.2024.
//

import SwiftUI

struct MarketingSpecialist: Hashable {
    var name: String
    let image: UIImage
    let grade: Grade
    let marketplace: Marketplace
    let rating: Double
    let completeSalesCount: Int
    let needToCompleteSales: Int = 1700
    let mobileOperator: MobileOperator
    
    var progress: Int {
        return completeSalesCount * 100 / needToCompleteSales
    }
}

extension MarketingSpecialist {
    enum Grade: String, CaseIterable {
        case junior = "Младший маркетолог"
        case medium = "Маркетолог"
        case senior = "Старший маркетолог"
        
        static var random: Self {
            return Grade.allCases.randomElement() ?? .junior
        }
    }
    
    enum Marketplace: String, CaseIterable {
        case wb = "Wildberries"
        case ozon = "Ozon"
        case sber = "Сбермаркет"
        case mega = "Мегамаркет"
        case aliExpress = "AliExpress"
        case kazanExpress = "KazanExpress"
        
        static var random: Self {
            return Marketplace.allCases.randomElement() ?? .wb
        }
    }
    
    enum MobileOperator: String, CaseIterable {
        case mts = "MTS Russia"
        case beeline = "Beeline Russia"
        case yota = "YOTA Russia"
        case megafon = "Megafon Russia"
        case tele2 = "TELE2 Russia"
        
        static var random: Self {
            return MobileOperator.allCases.randomElement() ?? .mts
        }
    }
}

// MARK: - Mock

extension MarketingSpecialist {
    static func mock() -> Self {
        return .init(
            name: "Элиот Мюллер",
            image: .Asset.User.man1.image,
            grade: MarketingSpecialist.Grade.random,
            marketplace: MarketingSpecialist.Marketplace.random,
            rating: Double.random(in: 4...5),
            completeSalesCount: Int.random(in: 1000...1700),
            mobileOperator: MarketingSpecialist.MobileOperator.random
        )
    }
    
    static func specialistsMock() -> [MarketingSpecialist] {
        return [
            .init(
                name: "Элиот Мюллер",
                image: .Asset.User.man1.image,
                grade: MarketingSpecialist.Grade.random,
                marketplace: MarketingSpecialist.Marketplace.random,
                rating: Double.random(in: 4...5),
                completeSalesCount: Int.random(in: 1000...1700),
                mobileOperator: MarketingSpecialist.MobileOperator.random
            ),
            .init(
                name: "Маргарита Симонян",
                image: .Asset.User.cat.image,
                grade: MarketingSpecialist.Grade.random,
                marketplace: MarketingSpecialist.Marketplace.random,
                rating: Double.random(in: 4...5),
                completeSalesCount: Int.random(in: 1000...1700),
                mobileOperator: MarketingSpecialist.MobileOperator.random
            ),
            .init(
                name: "Микаил Сартино",
                image: .Asset.User.man2.image,
                grade: MarketingSpecialist.Grade.random,
                marketplace: MarketingSpecialist.Marketplace.random,
                rating: Double.random(in: 4...5),
                completeSalesCount: Int.random(in: 1000...1700),
                mobileOperator: MarketingSpecialist.MobileOperator.random
            ),
            .init(
                name: "Игорь Прокофьев",
                image: .Asset.User.man3.image,
                grade: MarketingSpecialist.Grade.random,
                marketplace: MarketingSpecialist.Marketplace.random,
                rating: Double.random(in: 4...5),
                completeSalesCount: Int.random(in: 1000...1700),
                mobileOperator: MarketingSpecialist.MobileOperator.random
            ),
            .init(
                name: "Ренат Асторо",
                image: .Asset.User.man4.image,
                grade: MarketingSpecialist.Grade.random,
                marketplace: MarketingSpecialist.Marketplace.random,
                rating: Double.random(in: 4...5),
                completeSalesCount: Int.random(in: 1000...1700),
                mobileOperator: MarketingSpecialist.MobileOperator.random
            )
        ]
    }
}
