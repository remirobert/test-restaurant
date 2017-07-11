//
//  AppNavigator.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

protocol NavigatorProtocol {
    func showInitialScreen()
    func showDetailRestaurantScreen()
}

class AppNavigator: NavigatorProtocol {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func showInitialScreen() {
        self.showDetailRestaurantScreen()
    }

    func showDetailRestaurantScreen() {
        
    }
}
