//
//  AnyContainer.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 15.07.2024.
//

import Foundation

final class AnyContainer<Element> {
    
    // MARK: - Properties
    
    private let _add: (Element) -> Void
    private let _remove: () -> Element?
    
    // MARK: - Initialization and deinitialization
    
    init<C: Container>(_ container: C) where C.Item == Element {
        var containerCopy = container
        
        self._add = { item in
            containerCopy.add(item)
        }
        
        self._remove = {
            return containerCopy.remove()
        }
    }
}

// MARK: - Container
    
extension AnyContainer: Container {
    func add(_ item: Element) {
        _add(item)
    }

    func remove() -> Element? {
        return _remove()
    }
}
