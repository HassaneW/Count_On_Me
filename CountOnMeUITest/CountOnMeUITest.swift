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
            
            
            // In UI tests it is usually best to stop immediately when a failure occurs.
            continueAfterFailure = false
            app = XCUIApplication()

            // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    //        XCUIApplication().launch()
            app.launch()

            // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        }

        override func tearDown() {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            
            super.tearDown()
        }

        func testAddition() throws {
            
            app.buttons["1"].tap()
            
            let staticText = app/*@START_MENU_TOKEN@*/.staticTexts["1"]/*[[".buttons[\"1\"].staticTexts[\"1\"]",".staticTexts[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            staticText.tap()
            app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            staticText.tap()
            app.buttons["="].tap()
            
            let textView = app.textViews.firstMatch
            
            XCTAssertEqual(textView.value as? String, "1 + 1 = 2.0")
            
            // Use recording to get started writing UI tests.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
            
            
        }

}
