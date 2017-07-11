//
//  AppDelegate.swift
//  lafourchette-test
//
//  Created by Remi Robert on 10/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let viewModel = DetailRestaurantViewModel(provider: NetworkProvider(), restaurantId: "6861")
        let rootController = DetailRestaurantViewController(viewModel: viewModel)

        rootController.view.backgroundColor = UIColor.white
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        return true
    }
}
