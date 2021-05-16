//
//  AllCollectionViewController.swift
//  SegmentedControl
//
//  Created by Emiliano Barbosa on 12/05/21.
//

import UIKit
import SkeletonView

class AllCollectionViewController: UICollectionViewController {
    
    private var osList: [OS] = []
    private let reuseToday = "cellID"
    
    init(osList: [OS]) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.osList = osList
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .meninasC
    }
    
    func set(osList: [OS]) {
        self.osList = osList
        self.collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension AllCollectionViewController: CollectionViewCodable {
    func setupNavigationItem() {
    }
    func setupCellRegister() {
        collectionView.register(AllCollectionViewCell.self, forCellWithReuseIdentifier: reuseToday)
    }
}

// MARK: - Data Source
extension AllCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.osList.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseToday,for: indexPath) as! AllCollectionViewCell
        return cell
    }
}

// MARK: - Flow Layout
extension AllCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 48, height: view.bounds.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
}

extension AllCollectionViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "cellID"
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.osList.count
    }
}
