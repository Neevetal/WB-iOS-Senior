//
//  Trend.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 12.08.2024.
//

import Foundation

struct Trend: Identifiable {
    let id: Int
    let monthId: Int
    let movie: Int
    let info: TrendInfo
}

// MARK: - Mock

extension Trend {
    static func mock() -> Self {
        return .init(id: 0, monthId: 01, movie: 100, info: .mock())
    }
    
    static func arrayMock() -> [Self] {
        return [
            .init(id: 0, monthId: 1, movie: 100, info: .mock()),
            .init(id: 1, monthId: 2, movie: 80, info: .mock()),
            .init(id: 2, monthId: 3, movie: 65, info: .mock()),
            .init(id: 3, monthId: 4, movie: 50, info: .mock()),
            .init(id: 4, monthId: 5, movie: 80, info: .mock()),
            .init(id: 5, monthId: 6, movie: 90, info: .mock()),
            .init(id: 6, monthId: 7, movie: 70, info: .mock()),
            .init(id: 7, monthId: 8, movie: 50, info: .mock()),
            .init(id: 8, monthId: 9, movie: 30, info: .mock()),
            .init(id: 9, monthId: 10, movie: 45, info: .mock()),
            .init(id: 10, monthId: 11, movie: 70, info: .mock()),
            .init(id: 11, monthId: 12, movie: 90, info: .mock())
        ]
    }
}
