//
//  Injected.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 21.08.2024.
//

import SwiftUI

@propertyWrapper 
struct Injected<Dependency> {
    let wrappedValue: Dependency
    
    init() {
        self.wrappedValue =
        Injection.shared.container.resolve(Dependency.self)!
    }
}
