//
//  DetailRestaurantViewController.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class DetailRestaurantViewController: UIViewController {
    fileprivate let dataSource: CollectionViewDataSource<CellViewData>
    fileprivate let collectionViewLayout: UICollectionViewLayout
    fileprivate let collectionView: UICollectionView
    fileprivate let viewModel: DetailRestaurantViewModel
    
    init(viewModel: DetailRestaurantViewModel,
         collectionViewLayout: UICollectionViewLayout = ListViewLayout()) {
        self.viewModel = viewModel
        self.dataSource = CollectionViewDataSource<CellViewData>()
        self.collectionViewLayout = collectionViewLayout
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.collectionViewLayout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
        setupViews()
        bindViewModel()
    }
}

extension DetailRestaurantViewController {
    fileprivate func bindViewModel() {
        viewModel.ready()
        viewModel.didChangeData = { [weak self] datas in
            self?.dataSource.updateDatas(datas: datas)
            self?.collectionView.reloadData()
        }
    }
}

extension DetailRestaurantViewController {
    fileprivate func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    fileprivate func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupViews() {
        collectionView.backgroundColor = UIColor.white
        registerCollectionViewCells()
        setupCollectionViewDataSource()
    }
    
    private func registerCollectionViewCells() {
        collectionView.registerCell(withClass: ImageCell.self)
        collectionView.registerCell(withClass: TitleCell.self)
        collectionView.registerCell(withClass: RankCell.self)
        collectionView.registerCell(withClass: MapCell.self)
    }
}

extension DetailRestaurantViewController {
    fileprivate func setupCollectionViewDataSource() {
        dataSource.cellFactory = { [weak self] collectionView, viewData, indexPath in
            guard let cell = self?.dequeuCell(AtIndexPath: indexPath), cell is UICollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: viewData)
            return cell as! UICollectionViewCell
        }
        collectionView.dataSource = dataSource
    }
    
    private func dequeuCell(AtIndexPath indexPath: IndexPath) -> CellType? {
        let dequeuCellsIdentifiers = [
            ImageCell.identifier,
            TitleCell.identifier,
            RankCell.identifier,
            MapCell.identifier
        ]
        guard let identifier = dequeuCellsIdentifiers[safe: indexPath.row] else {
            return nil
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CellType
    }
}
