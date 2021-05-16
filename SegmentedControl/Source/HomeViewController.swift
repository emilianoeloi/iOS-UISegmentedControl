//
//  ViewController.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var navSegmentControl: UISegmentedControl?
    var viewControllers: [OSViewController] = []
    let allViewController: AllCollectionViewController? = nil
    var oslist: [OS] = Bundle.main.decode([OS].self, from: "osList.json")
    
    private func makeSegmentControl(osList: [OS]) -> UISegmentedControl {
        let navSegmentControl = UISegmentedControl()
        
        navSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        navSegmentControl.addTarget(self, action: #selector(madeSelection), for: .valueChanged)
        var i = OSindex.unix.rawValue
        
        for os in osList {
            let vc = OSViewController(os: os)
            if let os = vc.os,
               os.index == OSindex.linux {
                vc.view.isHidden = true
            } else {
                vc.view.isHidden = true
            }
            navSegmentControl.insertSegment(withTitle: os.name, at: i, animated: true)
            self.viewControllers.append(vc)
            self.addAsChildVC(childVC: vc)
            
            i += 1
        }
        
        navSegmentControl.selectedSegmentIndex = OSindex.linux.rawValue
        
        return navSegmentControl
    }
    let containerView: UIView = {
        var container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "HomeViewController"
        view.backgroundColor = UIColor(named: "background")
        
        
        
        navSegmentControl = makeSegmentControl(osList: self.oslist )
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
        
        for vc in self.viewControllers {
            if let os = vc.os,
               os.index.rawValue == sender.selectedSegmentIndex {
                vc.view.isHidden = true
            } else {
                vc.view.isHidden = true
            }
        }
    }
}

extension HomeViewController: ViewCodable {
    func setupViews() {
        view.addSubview(containerView)
        guard let nav = navSegmentControl else { return }
        
        addAsChildVC(childVC: AllCollectionViewController(osList: self.oslist))
        nav.insertSegment(withTitle: "Todos", at: self.viewControllers.count , animated: true)
        
        view.addSubview(nav)
    }
    func setupAnchors() {
        guard let nav = navSegmentControl else { return }
        NSLayoutConstraint.activate([
            
            nav.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            nav.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nav.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: nav.bottomAnchor, constant: 12),
            containerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
