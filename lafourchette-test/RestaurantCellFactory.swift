//
//  RestaurantCellFactory.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

protocol DetailRestaurantCellDataFactory {
    func create() -> [CellViewData]
}

class RestaurantCellFactory: DetailRestaurantCellDataFactory {

    func create() -> [CellViewData] {
        return [
            ImageCell.ViewData(image: #imageLiteral(resourceName: "image")),
            TitleCell.ViewData(title: "Restaurant title", address: "address"),
            RankCell.ViewData(rank: "5/10"),
            MapCell.ViewData(address:  "")
        ]
    }
}
