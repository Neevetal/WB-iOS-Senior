//
//  Calculator.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import Foundation

final class Calculator {
    func add<T: Numeric>(_ a: T, _ b: T) -> T {
        return a + b
    }
    
    func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
        return a - b
    }
    
    func multiply<T: Numeric>(_ a: T, _ b: T) -> T {
        return a * b
    }
    
    func divide<T: BinaryFloatingPoint>(_ a: T, _ b: T) -> T {
        return a / b
    }
}
