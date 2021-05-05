//
//  scUITests.swift
//  scUITests
//
//  Created by Emiliano Barbosa on 04/05/21.
//

import XCTest

class iOSViewControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    func test_Displaying_iOS() {
        app.launch()
        XCTAssertTrue(app.isDisplayingiOSViewController)
    }
}
