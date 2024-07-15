//
//  Queue.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import Foundation

struct Queue<Element> {
    
    // MARK: - Properties
    
    private var elements: [Element] = []
}

// MARK: - Public methods

extension Queue {
    mutating func enqueue(_ item: Element) {
        elements.append(item)
    }

    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        
        return elements.removeFirst()
    }
}
