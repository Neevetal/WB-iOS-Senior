//
//  MarketingSpecialist.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 07.08.2024.
//

import SwiftUI

struct MarketingSpecialist {
    let name: String
    let image: UIImage
    let grade: Grade
    let marketplace: Marketplace
    let rating: Double
    let completeSalesCount: Int
}

extension MarketingSpecialist {
    enum Grade: String, CaseIterable {
        case junior = "Младший маркетолог"
        case medium = "Маркетолог"
        case senior = "Старший маркетолог"
        
        var random: Self {
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
        
        var random: Self {
            return Marketplace.allCases.randomElement() ?? .wb
        }
    }
}
