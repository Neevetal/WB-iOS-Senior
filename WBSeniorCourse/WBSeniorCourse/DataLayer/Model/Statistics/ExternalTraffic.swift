//
//  ExternalTraffic.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 13.08.2024.
//

import Foundation

struct ExternalTraffic {
    let monthId: Int
    let purchasesValue: Double
    let newClientsCount: Int
    let clientsCount: Int
    
    var purchasesPercent: Double {
        return round(purchasesValue * 1000) / 10
    }
}

extension ExternalTraffic {
    static let maxValue: Self = .init(
        monthId: 12,
        purchasesValue: 1,
        newClientsCount: 1000,
        clientsCount: 1000
    )
}

// MARK: - Mock

extension ExternalTraffic {
    static func mock() -> Self {
        return .init(
            monthId: 1,
            purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
            newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
            clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
        )
    }
    
    static func arrayMock() -> [Self] {
        return [
            .init(
                monthId: 1,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 2,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 3,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 4,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 5,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 6,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 7,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 8,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 9,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 10,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 11,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
            .init(
                monthId: 12,
                purchasesValue: .random(in: 0...ExternalTraffic.maxValue.purchasesValue),
                newClientsCount: .random(in: 0...ExternalTraffic.maxValue.newClientsCount),
                clientsCount: .random(in: 0...ExternalTraffic.maxValue.clientsCount)
            ),
        ]
    }
}
