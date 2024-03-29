//
//  ListViewLayout.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class ListViewLayout: UICollectionViewFlowLayout {
    
    private let defaultSize = CGSize(width: UIScreen.main.bounds.size.width, height: 50)

    override init() {
        super.init()
        configureLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        sectionInset = UIEdgeInsets.zero
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .vertical
        self.estimatedItemSize = defaultSize
    }
}
