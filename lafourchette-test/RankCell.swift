//
//  DetailRankCollectionViewCell.swift
//  lafourchette-test
//
//  Created by Remi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class RankCell: UICollectionViewCell, CellType {
    fileprivate let rankLabel = UILabel(frame: CGRect.zero)
    
    struct ViewData: CellViewData {
        let rank: String
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
        layoutAttributes.bounds.size.height = 50
        return layoutAttributes
    }
}

extension RankCell {
    fileprivate func setupHierarchy() {
        contentView.addSubview(rankLabel)
    }
    
    fileprivate func setupLayout() {
        rankLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupViews() {
        rankLabel.font = UIFont.boldSystemFont(ofSize: 18)
        rankLabel.textAlignment = .center
        backgroundColor = UIColor.white
    }
}

extension RankCell {
    func configure(with model: CellViewData) {
        guard let model = model as? ViewData else { return }
        rankLabel.text = model.rank
    }
}
