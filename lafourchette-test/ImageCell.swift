//
//  DetailImageCollectionViewCell.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import SnapKit

class ImageCell: UICollectionViewCell, CellType {
    fileprivate let imageView = UIImageView(frame: CGRect.zero)

    class ViewData: CellViewData {
        private let image: String?
        private let imageDownloader: ImageDownloader

        init(image: String?, imageDownloader: ImageDownloader) {
            self.image = image
            self.imageDownloader = imageDownloader
        }

        func downloadImage(completion: @escaping (UIImage?) -> Void) {
            guard let image = image else {
                completion(nil)
                return
            }
            imageDownloader.getImage(path: image) { result in
                switch result {
                case .Success(let image):
                    completion(image)
                default:
                    completion(nil)
                }
            }
        }
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
        print(model)
        guard let model = model as? ViewData else { return }
        model.downloadImage { [weak self] image in
            self?.imageView.image = image
        }
    }
}
