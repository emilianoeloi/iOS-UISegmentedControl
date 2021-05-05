//
//  OSViewController.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import UIKit

class OSViewController: UIViewController {
    private let titleView: UILabel = {
        var title = UILabel(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 24)
        return title
    }()
    public var os: OS? {
        didSet {
            guard let name = os?.name else { return }
            self.titleView.text = name
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "OSViewController"
        setup()
    }
}

extension OSViewController: ViewCodable {
    func setupViews() {
        
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        view.addSubview(titleView)
    }
    func setupAnchors() {
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 8)
        ])
    }
}
