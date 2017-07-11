//
//  DetailImageCollectionViewCell.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Stevia
import SnapKit

class DetailImageCollectionViewCell: UICollectionViewCell {

    private let imageView = UIImageView(frame: CGRect.zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        setupViews()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
// Calculate the smallest height required that fits the cell content. The width is set in ListFlowLayout.swift
//        self.setNeedsLayout()
//        self.layoutIfNeeded()

        layoutAttributes.bounds.size.width = UIScreen.main.bounds.size.width
        layoutAttributes.bounds.size.height = 300//CGFloat(arc4random() % 500) + 200.0
        return layoutAttributes
    }

//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let attributs = super.preferredLayoutAttributesFitting(layoutAttributes)
//        attributs.frame.size.width = UIScreen.main.bounds.size.height
//        attributs.frame.size.height = systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
//        return attributs
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        contentView.addSubview(imageView)
    }

    private func setupLayout() {
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.topMargin.equalToSuperview()
//            make.bottomMargin.equalToSuperview()
//            make.leftMargin.equalToSuperview()
//            make.rightMargin.equalToSuperview()
//            make.width.equalToSuperview()
//            make.height.equalTo(Int(arc4random() % 500) + 200)
        }
    }

    private func setupViews() {
        backgroundColor = UIColor.orange
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        contentView.clipsToBounds = true
    }

    func configure() {
        imageView.image = UIImage(named: "image")
    }
}
