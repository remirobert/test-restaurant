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
    private let controllerFactory: UIViewControllerFactory

    init(window: UIWindow,
         controllerFactory: UIViewControllerFactory = ControllerFactory()) {
        self.window = window
        self.controllerFactory = controllerFactory
    }

    func showInitialScreen() {
        self.showDetailRestaurantScreen()
        window.makeKeyAndVisible()
    }

    func showDetailRestaurantScreen() {
        let detailController = controllerFactory.createDetailController()
        window.rootViewController = detailController
    }
}
