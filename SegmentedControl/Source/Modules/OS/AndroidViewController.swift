//
//  AndroidViewController.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import UIKit

class AndroidViewController: OSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "AndroidViewController"
        
        let android = OS(name: "Android")
        self.os = android
        
        view.backgroundColor = .osB
        
    }

}
