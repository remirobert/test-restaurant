//
//  NetworkProvider.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation

let APIEndPoint: String = "https://api.lafourchette.com/api?key=IPHONEPRODEDCRFV&method=restaurant_get_info&id_restaurant="

class NetworkProvider {
    fileprivate let network: JSONDownloader
    fileprivate let endPoint: String

    init(endPoint: String = APIEndPoint,
         network: JSONDownloader = Network()) {
        self.endPoint = endPoint
        self.network = network
    }
}

extension NetworkProvider: RestaurantProvider {
    func restaurant(withRestaurantId id: String, completion: @escaping (Restaurant?) -> Void) {
        let absolutePath = "\(endPoint)\(id)"
        network.getJSON(path: absolutePath) { result in
            switch result {
            case .Success(let json):
                completion(Restaurant(json: json))
            case .Failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
