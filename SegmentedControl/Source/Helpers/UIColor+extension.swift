//
//  UIColor+extension.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 04/05/21.
//

import UIKit

// OS
extension UIColor {
    static let osA = UIColor(rgb: 0x6FD904)
    static let osB = UIColor(rgb: 0xA8D95F)
    static let osC = UIColor(rgb: 0xA4A66F)
    static let osD = UIColor(rgb: 0xF2F2F2)
    static let osE = UIColor(rgb: 0x0D0D0D)
}

// Meninas
// https://color.adobe.com/pt/search?q=meninas
extension UIColor {
    static let meninasA = UIColor(rgb: 0xF25270)
    static let meninasB = UIColor(rgb: 0x0477BF)
    static let meninasC = UIColor(rgb: 0xF2C48D)
    static let meninasD = UIColor(rgb: 0x592D1D)
    static let meninasE = UIColor(rgb: 0xF2F2F2)
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: 1.0
        )
    }
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
