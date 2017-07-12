//
//  StubImageDownloader.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
@testable import lafourchette_test

internal final class StubImageDownloader: ImageDownloader {
    func getImage(path: String, completionRequest: @escaping CompletionGetImage) {
        let image = UIImage(named: "image")
        completionRequest(Result<UIImage>.Success(image!))
    }
}
