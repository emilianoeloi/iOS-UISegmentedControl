//
//  AllCollectionViewCell.swift
//  SegmentedControl
//
//  Created by Emiliano Barbosa on 12/05/21.
//

import UIKit
import SkeletonView

class AllCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .meninasD
        
        createLabel()
        createImageView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createImageView() {
        imageView = UIImageView(image: UIImage(named: "picture"))
        imageView.isSkeletonable = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75)
            ])
        
        
    }
    
    private func createLabel() {
        label = UILabel()
        label.isSkeletonable = true
        label.text = "Lorem ipsum"
        label.textColor = .meninasE
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 40),
            label.widthAnchor.constraint(equalToConstant: frame.width)
            ])
    }
    
}

