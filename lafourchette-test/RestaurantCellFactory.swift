//
//  RestaurantCellFactory.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

protocol DetailRestaurantCellDataFactory {
    var restaurant: Restaurant? { get set }
    func create() -> [CellViewData]
}

class RestaurantCellFactory: DetailRestaurantCellDataFactory {
    private let imageDownloader: ImageDownloader
    var restaurant: Restaurant?

    init(imageDownloader: ImageDownloader = Network()) {
        self.imageDownloader = imageDownloader
    }

    func create() -> [CellViewData] {
        guard let restaurant = restaurant else {
            return []
        }
        return [
            ImageCell.ViewData(image: restaurant.imageUrl, imageDownloader: imageDownloader),
            TitleCell.ViewData(title: restaurant.name, address: restaurant.description),
            RankCell.ViewData(rank: "\(restaurant.rate)"),
            MapCell.ViewData(location: restaurant.location)
        ]
    }
}
