//
//  DetailRestaurantSnapshotTests.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import FBSnapshotTestCase
@testable import lafourchette_test

class DetailRestaurantSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testDetailRestaurantController() {
        let viewModel = MockedRestaurantViewModel(provider: NetworkProvider(), restaurantId: "")
        let controller = DetailRestaurantViewController(viewModel: viewModel)
        controller.viewDidLoad()
        let _ = controller.view
        FBSnapshotVerifyView(controller.view)
    }
}

internal class MockedRestaurantViewModel: DetailRestaurantViewModel {
    override func ready() {
        let viewsData: [CellViewData] = [
            ImageCell.ViewData(image: "", imageDownloader: StubImageDownloader()),
            TitleCell.ViewData(title: "Title", description: "description"),
            RankCell.ViewData(rank: "4"),
            MapCell.ViewData(location: Location(lat: 0, long: 0))
        ]
        didChangeData?(viewsData)
    }
}

