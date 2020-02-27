//
//  CristinaDC_Task1_NOBDDUITests.swift
//  CristinaDC_Task1_NOBDDUITests
//
//  Created by user167360 on 2/27/20.
//  Copyright © 2020 user167360. All rights reserved.
//

import XCTest

class DoNoTDisturbMode_Through_Settings_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settingsApp.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCheckDoNotDisturbModeIsOffByDefault() {

        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        XCTAssertTrue(settingsApp.tables.cells.staticTexts["General"].waitForExistence(timeout: 10),("General option has not been load"))
        settingsApp.swipeUp()
        
        XCTAssertTrue(settingsApp.tables.cells.staticTexts["Do Not Disturb"].waitForExistence(timeout: 10),("Do not Disturb option does not exists"))
        settingsApp.tables.cells.staticTexts["Do Not Disturb"].tap()
        XCTAssertTrue(settingsApp.switches["Do Not Disturb"].waitForExistence(timeout: 10),("Do not disturb switch not found"))
        XCTAssertEqual(settingsApp.switches["Do Not Disturb"].value as! String,"0",("Do not Disturb is ON by default"))
        
    }
        
    func testCheckDoNotDisturbMStatusChangesByTappingSlider() {
        let settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        XCTAssertTrue(settingsApp.tables.cells.staticTexts["General"].waitForExistence(timeout: 10),("General option has not been load"))
        settingsApp.swipeUp()
        
        XCTAssertTrue(settingsApp.tables.cells.staticTexts["Do Not Disturb"].waitForExistence(timeout: 10),("Do not Disturb option does not exists"))
        settingsApp.tables.cells.staticTexts["Do Not Disturb"].tap()
        XCTAssertTrue(settingsApp.switches["Do Not Disturb"].waitForExistence(timeout: 10),("Do not disturb switch not found"))
        settingsApp.switches["Weather Conditions"].tap()
        XCTAssertEqual(settingsApp.switches["Weather Conditions"].value as! String,"1")
        
        
        
        }
        
}

        
