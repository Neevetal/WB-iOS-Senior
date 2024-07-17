//
//  Array + Extension.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 17.07.2024.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    var firstSafe: Element? {
        return isEmpty ? nil : self[0]
    }
    
    var lastSafe: Element? {
        return isEmpty ? nil : self[count - 1]
    }
}
