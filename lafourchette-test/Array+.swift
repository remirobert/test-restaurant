//
//  Array+.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        if self.indices ~= index {
            return self[index]
        }
        return nil
    }
}
