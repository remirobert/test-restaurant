//
//  DetailRestaurantViewModel.swift
//  lafourchette-test
//
//  Created by Remi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

class DetailRestaurantViewModel {

    private let restaurantId: String
    private let provider: RestaurantProvider
    private var cellDataFactory: DetailRestaurantCellDataFactory

    var didChangeData: (([CellViewData]) -> Void)?

    init(provider: RestaurantProvider,
         restaurantId: String,
         cellDataFactory: DetailRestaurantCellDataFactory = RestaurantCellFactory()) {
        self.provider = provider
        self.restaurantId = restaurantId
        self.cellDataFactory = cellDataFactory
    }

    func ready() {
        self.provider.restaurant(withRestaurantId: restaurantId) { [weak self] restaurant in
            guard let weakSelf = self else { return }
            guard let restaurant = restaurant else { return }
            weakSelf.cellDataFactory.restaurant = restaurant
            let viewDatas = weakSelf.cellDataFactory.create()
            DispatchQueue.main.async {
                weakSelf.didChangeData?(viewDatas)
            }
        }
    }
}
