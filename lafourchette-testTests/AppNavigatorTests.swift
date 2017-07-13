//
//  AppNavigatorTests.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import lafourchette_test

class AppNavigatorTests: QuickSpec {
    override func spec() {
        describe("AppNavigatorTests") { 
            it("should show the right UIViewController as initial controller") {
                let controller = UIViewController()
                let window = UIWindow()
                let controllerFactory = MockedControllerFactory(controller: controller)
                let navigator = AppNavigator(window: window, controllerFactory: controllerFactory)
                navigator.showInitialScreen()
                expect(window.rootViewController) === controller
            }
            it("should show the right UIViewController as DetailRestaurant") {
                let controller = UIViewController()
                let window = UIWindow()
                let controllerFactory = MockedControllerFactory(controller: controller)
                let navigator = AppNavigator(window: window, controllerFactory: controllerFactory)
                navigator.showDetailRestaurantScreen()
                expect(window.rootViewController) === controller
            }
        }
    }
}

internal final class MockedControllerFactory: UIViewControllerFactory {
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func createDetailController() -> UIViewController {
        return controller
    }
}
