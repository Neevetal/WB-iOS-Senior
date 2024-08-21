//
//  Injection.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 21.08.2024.
//

import Foundation
import Swinject

final class Injection {
    static public let shared = Injection()
    private init() {
        buildContainer()
    }
    
    // MARK: - Properties
    
    public var container: Swinject.Container {
        get {
            return _container!
        }
        set {
            _container = newValue
        }
    }
    private var _container: Swinject.Container?
}

// MARK: - Public methods

extension Injection {
    private func buildContainer() {
        let container = Swinject.Container()
        
        container.register(StatisticsService.self) { _ in
            return StatisticsService()
        }
        
        _container = container
    }
}
