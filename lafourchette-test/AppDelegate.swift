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
    
    let network = NetworkProvider()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let cellDataFactory = RestaurantCellFactory()
        let rootController = DetailRestaurantViewController(viewDataFactory: cellDataFactory)
        
        network.restaurant(withRestaurantId: "6861") { restaurant in
            print(restaurant)
        }
        
        rootController.view.backgroundColor = UIColor.white
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        return true
    }
}
