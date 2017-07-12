//
//  Restaurant.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

struct Location {
    let lat: Double
    let long: Double
}

struct Restaurant {
    let name: String
    let rate: Double
    let description: String
    let location: Location
    let imageUrl: String?

    init?(json: JSON) {
        guard let restaurantData = json["data"] as? JSON else { return nil }
        guard let name = restaurantData["name"] as? String,
            let rate = restaurantData["avg_rate"] as? Double,
            let description = restaurantData["description"] as? String,
            let lat = restaurantData["gps_lat"] as? Double,
            let long = restaurantData["gps_long"] as? Double else {
                return nil
        }
        self.name = name
        self.rate = rate
        self.description = description
        self.location = Location(lat: lat, long: long)
        imageUrl = (restaurantData["pics_main"] as? JSON)?["612x344"] as? String
    }
}
