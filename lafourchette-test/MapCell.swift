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

class MapCell: UICollectionViewCell, CellType, MKMapViewDelegate {
    fileprivate let mapView = MKMapView(frame: CGRect.zero)
    
    struct ViewData: CellViewData {
        let location: Location
    }
    
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
        layoutAttributes.bounds.size.width = UIScreen.main.bounds.size.width
        layoutAttributes.bounds.size.height = 300
        return layoutAttributes
    }
}

extension MapCell {
    fileprivate func setupHierarchy() {
        contentView.addSubview(mapView)
    }
    
    fileprivate func setupLayout() {
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    fileprivate func setupViews() {
        backgroundColor = UIColor.white
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
    }
}

extension MapCell {
    func configure(with model: CellViewData) {
        guard let model = model as? ViewData else { return }
        mapView.quickAddPointAndZoom(lat: model.location.lat, long: model.location.long)
    }
}
