//
//  ViewCodable.swift
//  jornada
//
//  Created by Emiliano Barbosa on 11/04/21.
//

import UIKit

protocol ViewCodable {
    func setup()
    func setupViews()
    func setupAnchors()
}

extension ViewCodable {

    func setup() {
        setupViews()
        setupAnchors()
    }

}

