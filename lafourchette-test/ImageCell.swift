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

class ImageCell: UICollectionViewCell, CellType {
    fileprivate let imageView = UIImageView(frame: CGRect.zero)
    
    struct ViewData: CellViewData {
        let image: String?
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        setupViews()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutAttributes.bounds.size.width = UIScreen.main.bounds.size.width
        layoutAttributes.bounds.size.height = 300
        return layoutAttributes
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageCell {
    fileprivate func setupHierarchy() {
        contentView.addSubview(imageView)
    }
    
    fileprivate func setupLayout() {
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupViews() {
        backgroundColor = UIColor.white
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        contentView.clipsToBounds = true
    }
}

extension ImageCell {
    func configure(with model: CellViewData) {
        guard let model = model as? ViewData else { return }
        guard let imageUrl = model.image else { return }
        loadImage(url: imageUrl)
    }

    private func loadImage(url: String) {
        guard let url = URL(string: url) else { return }
        do {
            let dataImage = try Data(contentsOf: url)
            imageView.image = UIImage(data: dataImage)
        } catch {

        }
    }
}
