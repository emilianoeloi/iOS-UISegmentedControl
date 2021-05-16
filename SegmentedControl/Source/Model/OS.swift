//
//  OS.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import Foundation

enum OSindex: Int, Decodable {
    case unix = 0
    case windows = 1
    case linux = 2
    case iOS = 3
    case android = 4
}

struct OS: Decodable {
    var index: OSindex
    var name: String
    var summary: String
}
