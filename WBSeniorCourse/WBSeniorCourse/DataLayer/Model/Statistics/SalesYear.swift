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
        
        let sales2023 = [850, 257, 367, 420, 340, 414, 387, 195, 280, 344, 205, 220]
        let months2023: [SalesMonth] = nativeMonths.enumerated().map { (index, element) in
            let salesCount = sales2023[index]
            let month = SalesMonth(
                name: element.name,
                salesCount: salesCount
            )
            
            return month
        }
        
        let sales2024 = [323, 401, 386, 632, 616, 810, 634, 567, 605, 390, 410, 999]
        let months2024: [SalesMonth] = nativeMonths.enumerated().map { (index, element) in
            let salesCount = sales2024[index]
            let month = SalesMonth(
                name: element.name,
                salesCount: salesCount
            )
            
            return month
        }
        
        return [
            .init(months: months2023, name: String(2023)),
            .init(months: months2024, name: String(2024))
        ]
    }
}
