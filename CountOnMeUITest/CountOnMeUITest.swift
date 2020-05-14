//
//  CountOnMeUITest.swift
//  CountOnMeUITest
//
//  Created by Wandianga on 01/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest

class CountOnMeUITest: XCTestCase {
    
    var app : XCUIApplication!
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testactionReset() throws {
        
        app.buttons["1"].tap()
        app.buttons["AC"].tap()
        
        let textView = app.textViews.firstMatch
        XCTAssertEqual(textView.value as? String, "0")
    }
    
    func testfactorisationErrorMessage() {
        
        app.buttons["+"].tap()
        app.buttons["="].tap()
        
        XCTAssertFalse(false)
    }
    
}
