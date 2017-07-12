//
//  ImageCellSnapshotTests.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import FBSnapshotTestCase
@testable import lafourchette_test

final class ImageCellSnapshotTests: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        recordMode = false
    }

    func testImageCellWithImage() {
        let imageDownloader = StubImageDownloader()
        let viewData = ImageCell.ViewData(image: "", imageDownloader: imageDownloader)
        let cell = ImageCell(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        cell.configure(with: viewData)
        FBSnapshotVerifyView(cell)
    }
}
