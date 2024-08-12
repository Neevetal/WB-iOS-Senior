//
//  SalesYear.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 13.08.2024.
//

import SwiftUI

struct YearKPISales {
    let salesKPI: Int
}

struct SalesYear: Identifiable {
    var id = UUID()
    let months: [SalesMonth]
    let color: Color
    let name: String
    
    static func mock2023() -> Self {
        return .init(
            months: [
                .init(name: "Янв", salesCount: 150),
                .init(name: "Фев", salesCount: 180),
                .init(name: "Мар", salesCount: 320),
                .init(name: "Апр", salesCount: 120),
                .init(name: "Май", salesCount: 250),
                .init(name: "Июнь", salesCount: 350),
                .init(name: "Июль", salesCount: 390),
                .init(name: "Авг", salesCount: 450),
                .init(name: "Сен", salesCount: 320),
                .init(name: "Окт", salesCount: 280),
                .init(name: "Ноя", salesCount: 210),
                .init(name: "Дек", salesCount: 150),
            ],
            color: .green, name: "2023"
        )
    }
    
    static func mock2024() -> Self {
        return .init(
            months: [
                .init(name: "Янв", salesCount: 250),
                .init(name: "Фев", salesCount: 280),
                .init(name: "Мар", salesCount: 420),
                .init(name: "Апр", salesCount: 520),
                .init(name: "Май", salesCount: 480),
                .init(name: "Июнь", salesCount: 350),
                .init(name: "Июль", salesCount: 320),
                .init(name: "Авг", salesCount: 280),
                .init(name: "Сен", salesCount: 320),
                .init(name: "Окт", salesCount: 400),
                .init(name: "Ноя", salesCount: 450),
                .init(name: "Дек", salesCount: 570),
            ],
            color: .red, name: "2024"
        )
    }
}

struct SalesMonth: Identifiable, Hashable {
    var id = UUID()
    let name: String
    let salesCount: Int
}
