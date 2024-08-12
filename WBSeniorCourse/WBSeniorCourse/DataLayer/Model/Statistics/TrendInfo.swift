//
//  TrendInfo.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 13.08.2024.
//

import Foundation

struct TrendInfo {
    let price: Int
    let purchasesCount: Int
    let clicksValue: Double
    let helpValue: Double
    
    var priceValue: Double {
        return Double(price) / Double(TrendInfo.maxValue.price)
    }
    
    var purchasesValue: Double {
        return Double(purchasesCount) / Double(TrendInfo.maxValue.purchasesCount)
    }
    
    var clicksPercent: Double {
        return round(clicksValue * 1000) / 10
    }
    
    var helpPercent: Double {
        return round(helpValue * 1000) / 10
    }
}

extension TrendInfo {
    static let maxValue: Self = .init(
        price: 1000,
        purchasesCount: 25000,
        clicksValue: 1,
        helpValue: 1
    )
}

// MARK: - Mock

extension TrendInfo {
    static func mock() -> Self {
        return .init(
            price: .random(in: 0...TrendInfo.maxValue.price),
            purchasesCount: .random(in: 0...TrendInfo.maxValue.purchasesCount),
            clicksValue: .random(in: 0...TrendInfo.maxValue.clicksValue),
            helpValue: .random(in: 0...TrendInfo.maxValue.helpValue)
        )
    }
}
