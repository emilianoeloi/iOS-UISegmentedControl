//
//  CollectionViewCodable.swift
//  jornada
//
//  Created by Emiliano Barbosa on 23/04/21.
//

import Foundation

protocol CollectionViewCodable {
    func setup()
    func setupNavigationItem()
    func setupCellRegister()
    func setupDelegate()
    func setupDataSource()
}

extension CollectionViewCodable {
    func setupDelegate() { }
    func setupDataSource() { }
}

extension CollectionViewCodable {
    func setup() {
        setupDelegate()
        setupDataSource()

        setupNavigationItem()
        setupCellRegister()
    }
}
