//
//  Result.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

enum Result<T> {
    case Success(T)
    case Failure(Error)
}
