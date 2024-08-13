//
//  SalesYear.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 13.08.2024.
//

import SwiftUI

struct SalesYear: Identifiable {
    var id = UUID()
    let months: [SalesMonth]
    let name: String
}

struct SalesMonth: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let salesCount: Int
}

// MARK: - mo

extension SalesYear {
    static func mock() -> Self {
        let nativeMonths = FormattedManager.generateMonths(formatter: FormattedManager.shortMonthFormatter)
        let months: [SalesMonth] = nativeMonths.map {
            return .init(
                name: $0.name,
                salesCount: .random(in: 0...999)
            )
        }
        
        return .init(months: months, name: String(2024))
    }
    
    static func arrayMock() -> [Self] {
        let nativeMonths = FormattedManager.generateMonths(formatter: FormattedManager.shortMonthFormatter)
        var startInt: Int = .random(in: 0...999)
        
        let months: [SalesMonth] = nativeMonths.map {
            let randomInt: Int = .random(in: -100...100)
            let salesCount = startInt + randomInt
            startInt = salesCount
            
            return .init(
                name: $0.name,
                salesCount: salesCount
            )
        }
        
        return [
            .init(months: months, name: String(2023)),
            .init(months: months, name: String(2024))
        ]
    }
}
