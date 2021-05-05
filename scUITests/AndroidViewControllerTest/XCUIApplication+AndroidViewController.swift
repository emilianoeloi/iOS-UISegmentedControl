//
//  XCUIApplication+HomeViewController.swift
//  scUITests
//
//  Created by Emiliano Barbosa on 04/05/21.
//

import XCTest

extension XCUIApplication {
    var isDisplayingAndroidViewController: Bool {
        return otherElements["AndroidViewController"].exists
    }
}
