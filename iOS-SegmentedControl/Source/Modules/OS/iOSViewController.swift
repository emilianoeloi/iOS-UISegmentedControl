//
//  iOSViewController.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import UIKit

class iOSViewController: OSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ios = OS(name: "iOS")
        self.os = ios
        view.backgroundColor = .osC
    }
}
