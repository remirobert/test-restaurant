//
//  ImageDownloaderTests.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import lafourchette_test

class ImageDownloaderTests: QuickSpec {
    override func spec() {
        describe("ImageDownloaderTests") {
            it("should get the correct error from getting data") {
                let imageDownloader = MockedNetworkDownloader(data: nil, error: NetworkError.invalidURL)
                var expectedError: Error!
                var expectedImage: UIImage!
                imageDownloader.getImage(path: "", completionRequest: { result in
                    switch result {
                    case .Success(let image):
                        expectedImage = image
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).toEventually(matchError(NetworkError.invalidURL))
                expect(expectedImage).toEventually(beNil())
            }
            it("should get the correct error if no data returned") {
                let imageDownloader = MockedNetworkDownloader(data: nil, error: nil)
                var expectedError: Error!
                var expectedImage: UIImage!
                imageDownloader.getImage(path: "", completionRequest: { result in
                    switch result {
                    case .Success(let image):
                        expectedImage = image
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).toEventually(matchError(NetworkError.noData))
                expect(expectedImage).toEventually(beNil())
            }
            it("should get an error on invalid data") {
                let data = Data()
                let imageDownloader = MockedNetworkDownloader(data: data, error: nil)
                var expectedError: Error!
                var expectedDataImage: UIImage!
                imageDownloader.getImage(path: "", completionRequest: { result in
                    switch result {
                    case .Success(let image):
                        expectedDataImage = image
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).toEventually(matchError(ImageDownloaderError.errorData))
                expect(expectedDataImage).to(beNil())
            }
            it("should get an image if received correct data") {
                let imageReceived = UIImage(named: "image")!
                let data = UIImagePNGRepresentation(imageReceived)!
                let imageDownloader = MockedNetworkDownloader(data: data, error: nil)
                var expectedError: Error!
                var expectedDataImage: UIImage!
                imageDownloader.getImage(path: "", completionRequest: { result in
                    switch result {
                    case .Success(let image):
                        expectedDataImage = image
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).toEventually(beNil())
                expect(expectedDataImage).toNotEventually(beNil())
            }
        }
    }
}

