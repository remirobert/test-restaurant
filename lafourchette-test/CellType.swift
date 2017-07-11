//
//  CellType.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

protocol CellViewData {}

protocol CellType: class {
    func configure(with model: CellViewData)
}
