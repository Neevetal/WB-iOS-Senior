//
//  User.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 08.07.2024.
//

import SwiftUI

final class User: ObservableObject {
    
    // MARK: - Property Wrappers
    
    @Published public var phone: String
    @Published public var code: String
    
    // MARK: - Initialization and deinitialization
    
    init(phone: String, code: String) {
        self.phone = phone
        self.code = code
    }
    
    // MARK: - Properties
    
    public var isPhoneValid: Bool {
        phone.count == 12
    }
}
