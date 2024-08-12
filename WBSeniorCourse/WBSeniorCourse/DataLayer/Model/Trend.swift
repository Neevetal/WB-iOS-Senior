//
//  Trend.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 12.08.2024.
//

import Foundation

struct Trend: Identifiable {
    var id: Int
    var monthId: Int
    var movie: Int
}

// MARK: - Mock

extension Trend {
    static func mock() -> Self {
        return .init(id: 0, monthId: 01, movie: 100)
    }
    
    static func arrayMock() -> [Self] {
        return [
            .init(id: 0, monthId: 01, movie: 100),
            .init(id: 1, monthId: 02, movie: 80),
            .init(id: 2, monthId: 03, movie: 65),
            .init(id: 3, monthId: 04, movie: 50),
            .init(id: 4, monthId: 05, movie: 80),
            .init(id: 5, monthId: 06, movie: 90),
            .init(id: 6, monthId: 07, movie: 70),
            .init(id: 7, monthId: 08, movie: 50),
            .init(id: 8, monthId: 09, movie: 30),
            .init(id: 9, monthId: 10, movie: 45),
            .init(id: 10, monthId: 11, movie: 70),
            .init(id: 11, monthId: 12, movie: 90)
        ]
    }
}
