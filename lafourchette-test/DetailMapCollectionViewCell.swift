//
//  DetailMapCollectionViewCell.swift
//  lafourchette-test
//
//  Created by Remi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import MapKit
import SnapKit

class DetailMapCollectionViewCell: UICollectionViewCell {

    private let mapView = MKMapView(frame: CGRect.zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // Calculate the smallest height required that fits the cell content. The width is set in ListFlowLayout.swift
        self.setNeedsLayout()
        self.layoutIfNeeded()

        layoutAttributes.bounds.size.width = UIScreen.main.bounds.size.width
        layoutAttributes.bounds.size.height = 300
        return layoutAttributes
    }

    private func setupHierarchy() {
        contentView.addSubview(mapView)
    }

    private func setupLayout() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupViews() {
        backgroundColor = UIColor.white
        mapView.isScrollEnabled = false
    }
}
