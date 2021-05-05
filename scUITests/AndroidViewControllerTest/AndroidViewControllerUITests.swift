//
//  scUITests.swift
//  scUITests
//
//  Created by Emiliano Barbosa on 04/05/21.
//

import XCTest

class AndroidViewControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    func test_Displaying_Android() {
        app.launch()
        app.segmentedControls.buttons["Android"].tap()
        XCTAssertTrue(app.isDisplayingAndroidViewController)
    }
}
