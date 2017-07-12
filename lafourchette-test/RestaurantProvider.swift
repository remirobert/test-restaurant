//
//  RestaurantProvider.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation

protocol RestaurantProvider {
    typealias RestaurantProviderGetCompletion = (Restaurant?) -> Void
    func restaurant(withRestaurantId id: String, completion: @escaping RestaurantProviderGetCompletion)
}
