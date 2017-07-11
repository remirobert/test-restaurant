//
//  CollectionViewDataSource.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class CollectionViewDataSource<T>: NSObject, UICollectionViewDataSource {
    typealias CellFactory = (UICollectionView, T, IndexPath) -> UICollectionViewCell
    var cellFactory: CellFactory?
    fileprivate let datas: [T]

    init(datas: [T]) {
        self.datas = datas
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellFactory = self.cellFactory else {
            return UICollectionViewCell()
        }
        return cellFactory(collectionView, datas[indexPath.row], indexPath)
    }
}
