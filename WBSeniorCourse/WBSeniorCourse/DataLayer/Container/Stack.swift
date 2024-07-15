//
//  Stack.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import Foundation

struct Stack<Element> {
    
    // MARK: - Properties
    
    private var elements: [Element] = []
}

// MARK: - Public methods

extension Stack {
    mutating func push(_ item: Element) {
        elements.append(item)
    }

    mutating func pop() -> Element? {
        return elements.popLast()
    }
}
