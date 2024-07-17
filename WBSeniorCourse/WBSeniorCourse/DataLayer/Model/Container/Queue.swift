//
//  Queue.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import Foundation

final class Queue<Element> {
    
    // MARK: - Properties
    
    private var elements: [Element] = []
}

// MARK: - Public methods

extension Queue {
    func enqueue(_ item: Element) {
        elements.append(item)
    }

    func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        
        return elements.removeFirst()
    }
}

// MARK: - Container

extension Queue: Container {
    typealias Item = Element
    
    func add(_ item: Element) {
        enqueue(item)
    }
    
    func remove() -> Element? {
        return dequeue()
    }
}
