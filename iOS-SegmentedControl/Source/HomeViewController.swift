//
//  ViewController.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import UIKit

class HomeViewController: UIViewController {

    let navSegmentControl: UISegmentedControl = {
        var navSegmentControl = UISegmentedControl()
        
        navSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        navSegmentControl.addTarget(self, action: #selector(madeSelection), for: .valueChanged)
        navSegmentControl.insertSegment(withTitle: "iOS", at: 0, animated: false)
        navSegmentControl.insertSegment(withTitle: "Android", at: 1, animated: false)
        navSegmentControl.selectedSegmentIndex = 0
        
        return navSegmentControl
    }()
    let containerView: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    lazy var iOSVC: iOSViewController = {
        let vc = iOSViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    lazy var androidVC: AndroidViewController = {
        let vc = AndroidViewController()
        self.addAsChildVC(childVC: vc)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        iOSVC.view.isHidden = false
        setup()
    }
    
    func addAsChildVC(childVC: UIViewController) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childVC.view.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor),
            childVC.view.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor)
        ])
        childVC.didMove(toParent: self)
    }
    
    private func removeAsChildVC(childVC: UIViewController) {
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
    @objc
    func madeSelection(_ sender: UISegmentedControl) {
        iOSVC.view.isHidden = sender.selectedSegmentIndex == 1
        androidVC.view.isHidden = sender.selectedSegmentIndex == 0
    }
}

extension HomeViewController: ViewCodable {
    func setupViews() {
        view.addSubview(containerView)
        view.addSubview(navSegmentControl)
    }
    func setupAnchors() {
        NSLayoutConstraint.activate([
            navSegmentControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            navSegmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navSegmentControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: navSegmentControl.bottomAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
