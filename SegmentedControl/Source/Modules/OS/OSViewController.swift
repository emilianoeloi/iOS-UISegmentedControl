//
//  OSViewController.swift
//  iOS-SegmentedControl
//
//  Created by Emiliano Barbosa on 03/05/21.
//

import UIKit
import SkeletonView

class OSViewController: UIViewController {
    private let titleView: UILabel = {
        var title = UILabel(frame: .zero)
        title.textColor = .meninasE
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        title.isSkeletonable = true
        title.showAnimatedGradientSkeleton()
        
        return title
    }()
    
    private let summaryView: UILabel = {
        var summary = UILabel(frame: .zero)
        summary.textColor = .meninasE
        summary.numberOfLines = 0
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.font = UIFont.systemFont(ofSize: 24)
        
        summary.isSkeletonable = true
        summary.showAnimatedGradientSkeleton()
        
        return summary
    }()
    
    init(os: OS) {
        super.init(nibName: nil, bundle: nil)
        self.os = os
        
        self.titleView.text = os.name
        self.summaryView.text = os.summary
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var os: OS? {
        didSet {
            guard let name = os?.name,
                  let summary = os?.summary else { return }
            self.titleView.text = name
            self.summaryView.text = summary
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = "OSViewController"
        view.backgroundColor = .meninasA
        
        setup()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            titleView.hideSkeleton(transition: .crossDissolve(0.25))
            summaryView.hideSkeleton(transition: .crossDissolve(0.25))
        }
    }
    
    override func viewDidLayoutSubviews() {
        view.layoutSkeletonIfNeeded()
    }
}

extension OSViewController: ViewCodable {
    func setupViews() {
        
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        
        view.addSubview(titleView)
        view.addSubview(summaryView)
    }
    func setupAnchors() {
        NSLayoutConstraint.activate([
            titleView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
            titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            titleView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
            //
            summaryView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
            summaryView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 8),
            summaryView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8)
        ])
    }
}
