//
//  WeatherConditions_Through_Settings_Tests.swift
//  CristinaDC_Task1_NOBDDUITests
//
//  Created by user167360 on 2/27/20.
//  Copyright © 2020 user167360. All rights reserved.
//

import XCTest

class WeatherConditions_Through_Settings_Tests: XCTestCase {

   override func setUp() {
          super.setUp()
        
            
        continueAfterFailure = false
        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settingsApp.launch()
        }

    override func tearDown() {
          super.tearDown()
    
        }

        func testSliderWeatherConditionsIsOnByDefault() {

            let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
            XCTAssertTrue(settingsApp.tables.cells.staticTexts["Maps"].waitForExistence(timeout: 10))
            settingsApp.tables.cells.staticTexts["Maps"].tap()
            XCTAssertTrue(settingsApp.tables.cells.staticTexts["Driving"].waitForExistence(timeout: 10))
        
            settingsApp.swipeUp()
            XCTAssertTrue(settingsApp.tables.cells.staticTexts["Weather Conditions"].waitForExistence(timeout: 10))
            XCTAssertTrue(settingsApp.switches["Weather Conditions"].waitForExistence(timeout: 10),("not found"))
            XCTAssertEqual(settingsApp.switches["Weather Conditions"].value as! String,"1")
            
        }
    
        func testSliderWeatherConditionsChangesByTapping() {

        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        XCTAssertTrue(settingsApp.tables.cells.staticTexts["Maps"].waitForExistence(timeout: 10))
        settingsApp.tables.cells.staticTexts["Maps"].tap()
        XCTAssertTrue(settingsApp.tables.cells.staticTexts["Driving"].waitForExistence(timeout: 10))
        settingsApp.swipeUp()
        XCTAssertTrue(settingsApp.tables.cells.staticTexts["Weather Conditions"].waitForExistence(timeout: 10))
        XCTAssertTrue(settingsApp.switches["Weather Conditions"].waitForExistence(timeout: 10),("not found"))
        XCTAssertEqual(settingsApp.switches["Weather Conditions"].value as! String,"1")
        settingsApp.switches["Weather Conditions"].tap()
        XCTAssertEqual(settingsApp.switches["Weather Conditions"].value as! String,"0")
            
        
       }
            
}
    
  
