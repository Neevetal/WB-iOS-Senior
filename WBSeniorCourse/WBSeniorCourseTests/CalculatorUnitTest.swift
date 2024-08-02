//
//  CalculatorUnitTest.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import XCTest
@testable import WBSeniorCourse

final class CalculatorUnitTest: XCTestCase {
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
}

// MARK: - Test methods

extension CalculatorUnitTest {
    func testAdd() {
        XCTAssertEqual(calculator.add(3, 2), 5)
        XCTAssertEqual(calculator.add(3.5, 2.5), 6.0)
    }

    func testSubtract() {
        XCTAssertEqual(calculator.subtract(3, 2), 1)
        XCTAssertEqual(calculator.subtract(3.5, 2.5), 1.0)
    }

    func testMultiply() {
        XCTAssertEqual(calculator.multiply(3, 2), 6)
        XCTAssertEqual(calculator.multiply(3.5, 2.5), 8.75)
    }

    func testDivide() {
        XCTAssertEqual(calculator.divide(6.0, 2.0), 3.0)
        XCTAssertEqual(calculator.divide(9.0, 3.0), 3.0)
    }

    func testDivideByZero() {
        let result = calculator.divide(6.0, 0.0)
        XCTAssert(result.isInfinite, "Expected 6.0 / 0.0 to be infinity")
    }
}
