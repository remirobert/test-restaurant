//
//  DetailTitleCollectionViewCell.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class TitleCell: UICollectionViewCell, CellType {
    fileprivate let titleLabel = UILabel(frame: CGRect.zero)
    fileprivate let addressLabel = UILabel(frame: CGRect.zero)
    fileprivate var titleLabelHeight: Constraint?
    
    struct ViewData: CellViewData {
        let title: String
        let address: String
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
        layoutAttributes.bounds.size.height = titleLabel.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height + addressLabel.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        return layoutAttributes
    }
}

extension TitleCell {
    fileprivate func setupHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
    }
    
    fileprivate func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leadingMargin.equalToSuperview().offset(10)
            make.trailingMargin.equalToSuperview().offset(-10)
            make.top.equalToSuperview()
            make.height.equalTo(25)
        }
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leadingMargin.equalToSuperview().offset(10)
            make.trailingMargin.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
    }
    
    fileprivate func setupViews() {
        backgroundColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 0
        addressLabel.font = UIFont.systemFont(ofSize: 10)
        addressLabel.textColor = UIColor.gray
        addressLabel.numberOfLines = 0
        addressLabel.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    }
}

extension TitleCell {
    func configure(with model: CellViewData) {
        guard let model = model as? ViewData else { return }
        titleLabel.text = model.title
        addressLabel.text = model.address
        contentView.setNeedsUpdateConstraints()
        contentView.updateConstraintsIfNeeded()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
}
