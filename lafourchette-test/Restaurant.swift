//
//  Restaurant.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

struct Restaurant {
    let title: String
    
    init?(json: JSON) {
        guard let title = json["title"] as? String else {
            return nil
        }
        self.title = title
    }
}
