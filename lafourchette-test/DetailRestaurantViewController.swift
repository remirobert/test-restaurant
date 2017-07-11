//
//  DetailRestaurantViewController.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Stevia
import SnapKit

class DetailRestaurantViewController: UIViewController {

    private let collectionViewLayout = ListViewLayout()
    private lazy var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero,
                                                                         collectionViewLayout: self.collectionViewLayout)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupViews()
    }

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupViews() {
        collectionViewLayout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 50)
        collectionView.backgroundColor = UIColor.blue
        collectionView.dataSource = self
        collectionView.register(DetailImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(DetailTitleCollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        collectionView.register(DetailRankCollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        collectionView.register(DetailMapCollectionViewCell.self, forCellWithReuseIdentifier: "cell3")
    }
}

extension DetailRestaurantViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DetailImageCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.backgroundColor = UIColor.red
            cell.configure()
            return cell
        }

        if indexPath.row == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as? DetailTitleCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure()
            return cell
        }
        if indexPath.row == 2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? DetailRankCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        if indexPath.row == 3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as? DetailMapCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        return UICollectionViewCell()
    }
}
