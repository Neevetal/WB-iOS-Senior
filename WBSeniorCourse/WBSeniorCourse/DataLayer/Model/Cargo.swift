//
//  Cargo.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 17.07.2024.
//

import Foundation

struct Cargo: Hashable {
    let width: Int
    let height: Int
    let depth: Int
    
    var volume: Int {
        return width * height * depth
    }
    
    var info: String {
        return """
        Информация:
        Ширина \(width)м
        Высота \(height)м
        Глубина \(depth)м
        Обьем \(volume)м^3
        """
    }
}

extension Cargo {
    static func randomMock() -> Cargo {
        return .init(
            width: .random(in: 1 ... 10),
            height: .random(in: 1 ... 10),
            depth: .random(in: 1 ... 10)
        )
    }
}

infix operator +++: AdditionPrecedence
func +++ (lhs: Cargo, rhs: Cargo) -> Int {
    return lhs.volume + rhs.volume
}
