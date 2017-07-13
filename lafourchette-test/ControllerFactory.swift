//
//  ControllerFactory.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 13/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

protocol UIViewControllerFactory {
    func createDetailController() -> UIViewController
}

class ControllerFactory: UIViewControllerFactory {
    
    private let detailViewModel: DetailRestaurantViewModel
    
    init(detailViewModel: DetailRestaurantViewModel = DetailRestaurantViewModel(provider: NetworkProvider(), restaurantId: "6861")) {
        self.detailViewModel = detailViewModel
    }
    
    func createDetailController() -> UIViewController {
        return DetailRestaurantViewController(viewModel: detailViewModel)
    }
}
