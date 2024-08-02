//
//  CalculatorUITest.swift
//  WBSeniorCourseUITests
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import XCTest

final class CalculatorUITest: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {}
}

// MARK: - Test methods

extension CalculatorUITest {
    func testAddition() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["0"]
        textField.tap()
        textField.typeText("5")
        
        app.buttons["+"].tap()
        
        textField.tap()
        textField.typeText("3")
        
        app.buttons["="].tap()
        XCTAssertEqual(textField.value as? String, "8")
    }
    
    func testSubtraction() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["0"]
        textField.tap()
        textField.typeText("5")
        
        app.buttons["-"].tap()
        
        textField.tap()
        textField.typeText("3")
        
        app.buttons["="].tap()
        XCTAssertEqual(textField.value as? String, "2")
    }
    
    func testMultiplication() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["0"]
        
        textField.tap()
        textField.typeText("5")
        
        app.buttons["*"].tap()
        
        textField.tap()
        textField.typeText("3")
        
        app.buttons["="].tap()
        XCTAssertEqual(textField.value as? String, "15")
    }
    
    func testDivision() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["0"]
        textField.tap()
        textField.typeText("6")
        
        app.buttons["/"].tap()
        
        textField.tap()
        textField.typeText("3")
        
        app.buttons["="].tap()
        XCTAssertEqual(textField.value as? String, "2")
    }
}
