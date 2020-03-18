//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by WANDIANGA on 04/03/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    
    var calculator : CalculatorCountOnMe!
    
    override func setUp() {
        super.setUp()
        
        calculator = CalculatorCountOnMe()
        
        
    }
    
    func testInitialValueElements() {
        XCTAssertEqual(calculator.elements, ["0"])
        
        calculator.expression = "12 + 4"
        
        XCTAssertEqual(calculator.elements, ["12","+","4"])
    }
    
    func testExpressionIsCorrect() {
        
        calculator.expression = "+"
        calculator.expression = "-"
        
        // When
        let result = calculator.expressionIsCorrect
        
        // Then
        XCTAssertFalse(result)
        
    }
    
    func testexpressionHaveEnoughElement() {
        
        calculator.expression = "23"
        
        let result = calculator.expressionHaveEnoughElement
        
        XCTAssertFalse(result)
        
    }
    
    func testCanAddOperator() {
        
        calculator.expression = "12 4 +"
        calculator.expression = "12 4 -"
        
        let result = calculator.canAddOperator
        
        XCTAssertFalse(result)
        
    }
    
    func testexpressionHaveResult() {
        
        calculator.expression = "12 4 ="
        
        let result = calculator.expressionHaveResult
        
        XCTAssertTrue(result)
        
    }
    
    
    
    func testResolveOperationWhenNotEnoughElement() {
        
        // Given
        
        calculator.expression = "23"
        
        // When
        
        let result = calculator.resolveOperation()
        
        // then
        
        XCTAssertEqual(result, ["23"])
    }
    
    func testResolveOperationWhenEnoughElement() {
        
        // Given
        
        calculator.expression = "12 + 4"
        
        // When
        
        let result = calculator.resolveOperation()
        
        // Then
        
        XCTAssertEqual(result, ["16"])
        
    }
}


