//
//  DetailTitleCollectionViewCell.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class DetailTitleCollectionViewCell: UICollectionViewCell {

    private let titleLabel = UILabel(frame: CGRect.zero)
    private let addressLabel = UILabel(frame: CGRect.zero)
    private var titleLabelHeight: Constraint?

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
        layoutAttributes.bounds.size.height = titleLabel.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height + addressLabel.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height//CGFloat(arc4random() % 500) + 200.0x
        return layoutAttributes
    }

    private func setupHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
    }

    private func setupLayout() {
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

    private func setupViews() {
        backgroundColor = UIColor.white
        titleLabel.textColor = UIColor.black
        titleLabel.numberOfLines = 0
        addressLabel.font = UIFont.systemFont(ofSize: 10)
        addressLabel.textColor = UIColor.gray
        addressLabel.numberOfLines = 0
        addressLabel.backgroundColor = UIColor.red.withAlphaComponent(0.5)
    }

    func configure() {
        titleLabel.text = "private let titleLabel"
        addressLabel.text = "private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let titleLabel private let let titleLabel"
        contentView.setNeedsUpdateConstraints()
        contentView.updateConstraintsIfNeeded()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
    }
}
