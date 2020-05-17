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
    
    func testInitialValueElements_GivenCalculExpressionIsEmpty_WhenAddValuesToCalculatorCalculExpression_ThenCalculatorElementReturnsAnArrayOfSeparateElements() {
        
        // Given
        calculator.expression = ""
        // When
        calculator.expression = "12 + 4"
        // Then
        XCTAssertEqual(calculator.elements, ["12","+","4"])
    }
    func testInitialValueElements_GivenCalculExpressionIsEmpty_WhenAddValuesToCalculatorCalculExpression_ThenCalculatorElementDoNotReturnsAnArrayOfSeparateElements() {
        
        calculator.expression = ""
        calculator.expression = "12 + 4"
        XCTAssertNotEqual(calculator.elements, ["12 + 4"])
    }
    func testExpressionIsCorrect_GivenLastValueCalculatorExpressionEqualAddition_WhenExpressionIsCorrectRuns_ThenExpressionIsCorrectIsFalse() {
        
        calculator.expression = "12 4 +"
        let result = calculator.expressionIsCorrect
        XCTAssertFalse(result)
    }
    func testExpressionIsCorrect_GivenLastValueCalculatorExpressionNotEqualAddition_WhenExpressionIsCorrectRuns_ThenExpressionIsCorrectIsTrue() {
        
        calculator.expression = "12 + 4"
        let result = calculator.expressionIsCorrect
        XCTAssertTrue(result)
    }
    func testExpressionIsCorrect_GivenLastValueCalculatorExpressionEqualSubstraction_WhenExpressionIsCorrectRuns_ThenExpressionIsCorrectIsFalse() {
        
        calculator.expression = "12 4 -"
        let result = calculator.expressionIsCorrect
        XCTAssertFalse(result)
    }
    func testExpressionIsCorrect_GivenLastValueCalculatorExpressionNotEqualSubstraction_WhenExpressionIsCorrectRuns_ThenExpressionIsCorrectIsTrue() {
        
        calculator.expression = "12 - 4"
        let result = calculator.expressionIsCorrect
        XCTAssertTrue(result)
    }
    func testexpressionHaveEnoughElement_GivenCalculatorExpressionLessthanThreeitems_WhenexpressionHaveEnoughElementRuns_ThenexpressionHaveEnoughElementisFalse() {
        
        calculator.expression = "23"
        let result = calculator.expressionHaveEnoughElement
        XCTAssertFalse(result)
    }
    func testexpressionHaveEnoughElement_GivenCalculatorExpressionAMinimumOfThreeitems_WhenexpressionHaveEnoughElementRuns_ThenexpressionHaveEnoughElementisTrue() {
        
        calculator.expression = "12 + 4"
        let result = calculator.expressionHaveEnoughElement
        XCTAssertTrue(result)
    }
    func testexpressionHaveResult_GivenCalculatorExpressionDoesNotContainTheEqualsign_WhenexpressionHaveResultRuns_ThenexpressionHaveResultIsFalse() {
        
        calculator.expression = "12 + 4"
        let result = calculator.expressionHaveResult
        XCTAssertFalse(result)
    }
    func testexpressionHaveResult_GivenCalculatorExpressionContainTheEqualsign_WhenexpressionHaveResultRuns_ThenexpressionHaveResultIsTrue() {
        
        calculator.expression = "12 + 4 ="
        let result = calculator.expressionHaveResult
        XCTAssertTrue(result)
    }
    func test_GivenCalculatorExpressionIsNotEmpty_WhenResolveOperationRuns_ThenResolveOperationreturnsArrayElement() {
        
        calculator.expression = "23"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "23")
    }
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnAddition() {
        
        calculator.expression = "12 + 4"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "16.00")
    }
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnSubstraction() {
        
        calculator.expression = "12 - 4"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "8.00")
    }
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnDivision() {
        
        calculator.expression = "12 / 4"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "3.00")
    }
    func test_GivenDivideTwoNumbers_WhenResolveOperationRuns_ThenReturnTheFiguresAfterTheComma() {
        
        calculator.expression = "12 / 5"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "2.40")
    }
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnMultiplication() {
        
        calculator.expression = "12 x 4"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "48.00")
    }
    func test_GivenIPerformAnOperationWithTwoOperatorsAdditionAndMultiplication_WhenILaunchTheOperation_ThenICalculateTheOperationWithTheMultiplicationFirst() {
        
        calculator.expression = "12 + 4 x 3"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "24.00")
    }
    func test_GivenQueIPutABadOperator_WhenILaunchTheOperation_ThenIHaveAnErrorMessage() {
        
        calculator.expression = "12 A 4"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "Bad operation")
    }
    func test_GivenOperationToReduceIsEmpty_WhenILaunchTheOperation_ThenIHaveAnErrorMessage() {
        
        calculator.expression = ""
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "Missing Result")
    }
    func test_GivenConvertLeftAndRightElements_WhenILaunchTheOperation_ThenIHaveAnErrorMessage() {
        
        calculator.expression = "A + B"
        let result = calculator.resolveOperation()
        XCTAssertEqual(result, "Invalid expression")
    }
    func test_GivenIEnterAnAdditionInTheParameter_WhentappedNumberButton_ThenIAddItToExpression() {
        
        calculator.tappedNumberButton(numberText: "1 + 1")
        XCTAssertEqual(calculator.expression, "1 + 1")
    }
    func test_GivenIEnterAnSubstractionInTheParameter_WhentappedNumberButton_ThenIAddItToExpression() {
        
        calculator.tappedNumberButton(numberText: "2 - 1")
        XCTAssertEqual(calculator.expression, "2 - 1")
    }
    func test_GivenIEnterAnDivisionInTheParameter_WhentappedNumberButton_ThenIAddItToExpression() {
        
        calculator.tappedNumberButton(numberText: "2 / 1")
        XCTAssertEqual(calculator.expression, "2 / 1")
    }
    func test_GivenIEnterAnMultiplicationInTheParameter_WhentappedNumberButton_ThenIAddItToExpression() {
        
        calculator.tappedNumberButton(numberText: "2 * 1")
        XCTAssertEqual(calculator.expression, "2 * 1")
    }
    
    func test_GivenIEnterAnOperationWithEqual_WhentappedNumberButton_ThenNothingHappens() {
        
        calculator.expression = "12 + 4 = 1"
        calculator.tappedNumberButton(numberText: "2")
        XCTAssertEqual(calculator.expression, "2")
    }
    
    func test_GivenIEnterAnOperatorAdditionInTheParameter_WhentappedOperatorButton_ThenIAddItToExpression() {
        
        calculator.expression = "7"
        calculator.tappedOperatorButton(with: "+")
        XCTAssertEqual(calculator.expression, "7 + ")
    }
    func test_GivenIEnterAnOperatorSubstractionInTheParameter_WhentappedOperatorButton_ThenIAddItToExpression() {
        
        calculator.expression = "7"
        calculator.tappedOperatorButton(with: "-")
        XCTAssertEqual(calculator.expression, "7 - ")
    }
    func test_GivenIEnterAnOperatorDivisionInTheParameter_WhentappedOperatorButton_ThenIAddItToExpression() {
        
        calculator.expression = "7"
        calculator.tappedOperatorButton(with: "/")
        XCTAssertEqual(calculator.expression, "7 / ")
    }
    func test_GivenIEnterAnOperatorMultiplicationInTheParameter_WhentappedOperatorButton_ThenIAddItToExpression() {
        
        calculator.expression = "7"
        calculator.tappedOperatorButton(with: "x")
        XCTAssertEqual(calculator.expression, "7 x ")
    }
    func test_GivenIEnterOneCharacterInExpression_WhentappedOperatorButton_ThenNothingHappens() {
        
        calculator.expression = "7"
        XCTAssertEqual(calculator.expression, "7")
        calculator.tappedOperatorButton(with: "Z")
        XCTAssertEqual(calculator.expression, "7")
    }
    func test_GivenIEnterLessThanThreeCharactersInExpression_WhentappedOperatorButton_ThenNothingHappens() {
        
        calculator.expression = "7 +"
        XCTAssertEqual(calculator.expression, "7 +")
        calculator.tappedOperatorButton(with: "+")
        XCTAssertEqual(calculator.expression, "7 +")
    }
    func test_GivenIEnterAnOperationWithEqual_WhentappedOperatorButton_ThenNothingHappens() {
        
        calculator.expression = "7 + 3 ="
        XCTAssertEqual(calculator.expression, "7 + 3 =")
        calculator.tappedOperatorButton(with: "+")
        XCTAssertEqual(calculator.expression, "7 + 3 =")
    }
    func test_GivenIEnterAnOperationWithEqual_tappedEqualButton_ThentappedEqualButtonMakesAnAddition()  {
        
        calculator.expression = "12 + 4"
        calculator.tappedEqualButton()
        XCTAssertEqual(calculator.expression, "12 + 4 = 16.00")
    }
    func test_GivenIEnterTwoCharactersInExpression_WhentappedEqualButton_ThenNothingHappens() {
        
        calculator.expression = "7 +"
        XCTAssertEqual(calculator.expression, "7 +")
        calculator.tappedEqualButton()
        XCTAssertEqual(calculator.expression, "7 +")
    }
    func test_GivenIEnterDividedByZeroInExpression_WhentappedEqualButton_ThenNothingHappens(){
        
        calculator.expression = "5 / 0"
        XCTAssertEqual(calculator.expression, "5 / 0")
        calculator.tappedEqualButton()
        XCTAssertEqual(calculator.expression, "5 / 0")
    }
    func test_GivenIEnterAnAddition_Whentappedreset_ThenExpressionEqualZero() {
        
        calculator.expression = "12 + 4"
        calculator.reset()
        XCTAssertEqual(calculator.expression, "0")
    }
    
}






