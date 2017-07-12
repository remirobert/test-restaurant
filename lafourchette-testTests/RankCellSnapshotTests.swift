//
//  RankCellSnapshotTests.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import FBSnapshotTestCase
@testable import lafourchette_test

class RankCellSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testRankCell() {
        let viewData = RankCell.ViewData(rank: "7")
        let cell = RankCell(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        cell.configure(with: viewData)
        FBSnapshotVerifyView(cell)
    }
}
