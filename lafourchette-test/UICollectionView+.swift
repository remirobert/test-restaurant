//
//  UICollectionView+.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCell(withClass cell: UICollectionViewCell.Type) {
        self.register(cell, forCellWithReuseIdentifier: cell.identifier)
    }
}
