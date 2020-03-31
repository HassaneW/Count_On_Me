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
    
    // Tester Calculator Element = Idéal Tester 1 Vrai/ 1faux / 1 equal
    
    /*
     Pour nommer les tests, on doit passer respecter le bdd (Behavior Driven Development) -> Test diriger par le comportement :
     
     A) Given : Etant donné que ... Position de départ
     B) When : Action que l'on veut tester
     C) Then : Alors .... Situation d'arriver du test
     
     Ex :
     Si on veut écrire un test qui contrôle le mode de fonctionnement d'un like
     
     GivenPostHasZeroLike_ -> Etant donné que le post à 0 like
     WhenPostlsLIked_ -> Quand je like le Post
     ThenPostHasOneLike_ -> Alors le Post à un like
     
     testGivenScoreIsNull_WhenIncrementingPlayer1Score_ThenScoreShouldBeFifteen() {
     
     Tester 1 Vrai/ 1faux / 1 equal
     
     */
    
    func testInitialValueElements_GivenCalculExpressionIsEmpty_WhenAddValuesToCalculatorCalculExpression_ThenCalculatorElementReturnsAnArrayOfSeparateElements() {
        
        
        calculator.expression = ""
        
        calculator.expression = "12 + 4"
        
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
    
    
    
    func testExpressionIsCorrect_GivenLastValueCalculatorExpressionNotEqualAddition_WhenExpressionIsCorrectRuns_ThenCanAddOperatorIsTrue() {
        
        calculator.expression = "12 + 4"
        
        let result = calculator.canAddOperator
        
        XCTAssertTrue(result)
        
    }
    
    func testCanAddOperator_GivenLastValueCalculatorExpressionEqualSubstraction_WhenExpressionIsCorrectRuns_ThenCanAddOperatorIsFalse() {
        
        calculator.expression = "12 4 -"
        
        let result = calculator.canAddOperator
        
        XCTAssertFalse(result)
        
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
        
        XCTAssertEqual(result, ["23"])
        
    }
    
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnAddition() {
        
        calculator.expression = "12 + 4"
        
        let result = calculator.resolveOperation()
        
        XCTAssertEqual(result, ["16"])
    }
    
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnSubstraction() {
        
        calculator.expression = "12 - 4"
        
        let result = calculator.resolveOperation()
        
        XCTAssertEqual(result, ["8"])
    }
    
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnDivision() {
           
           calculator.expression = "12 / 4"
           
           let result = calculator.resolveOperation()
           
           XCTAssertEqual(result, ["3"])
       }
    
    func test_GivenCalculatorExpressionHasMoreThanOnElement_WhenResolveOperationRuns_ThenResolveOperationMakesAnMultiplication() {
        
        calculator.expression = "12 x 4"
        
        let result = calculator.resolveOperation()
        
        XCTAssertEqual(result, ["48"])
    }
}


