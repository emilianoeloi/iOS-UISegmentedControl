//
//  scUITests.swift
//  scUITests
//
//  Created by Emiliano Barbosa on 04/05/21.
//

import XCTest

class HomeViewControllerUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    func test_Displaying_Home() {
        app.launch()
        XCTAssertTrue(app.isDisplayingHomeViewController)
    
    // test_Displaying_Home_Segemennt_Controll_iOS() {
        app.segmentedControls.buttons["iOS"].tap()
        
        XCTAssert(true)
        
    
    //  test_Displaying_Home_Segemennt_Controll_Android() {
        app.segmentedControls.buttons["Android"].tap()
        
        XCTAssert(true)
    }
}
