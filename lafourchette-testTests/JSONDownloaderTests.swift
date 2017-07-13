//
//  JSONDownloaderTests.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import lafourchette_test

class JSONDownloaderTests: QuickSpec {
    override func spec() {
        describe("JSONDownloaderTests") {
            it("should get the correct error for the network") {
                let mockedNetwork = MockedNetworkDownloader(data: nil, error: NetworkError.invalidURL)
                var expectedError: Error!
                var expectedJSON: [String:Any]!
                mockedNetwork.getJSON(path: "", completionRequest: { result in
                    switch result {
                    case .Success(let json):
                        expectedJSON = json
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).to(matchError(NetworkError.invalidURL))
                expect(expectedJSON).to(beNil())
            }
            it("should get the a parsing error if the data is invalid") {
                let jsonData = Data()
                let mockedNetwork = MockedNetworkDownloader(data: jsonData, error: nil)
                var expectedError: Error!
                var expectedJSON: [String:Any]!
                mockedNetwork.getJSON(path: "", completionRequest: { result in
                    switch result {
                    case .Success(let json):
                        expectedJSON = json
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).to(matchError(JSONDownloaderError.parseJSONError))
                expect(expectedJSON).to(beNil())
            }
            it("should get the correct JSON from the data received") {
                let json: [String:Any] = [
                    "name":"restanrant"
                ]
                let jsonData = self.jsonToData(json: json)
                let mockedNetwork = MockedNetworkDownloader(data: jsonData, error: nil)
                var expectedError: Error!
                var expectedJSON: [String:Any]!
                mockedNetwork.getJSON(path: "", completionRequest: { result in
                    switch result {
                    case .Success(let json):
                        expectedJSON = json
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).to(beNil())
                expect(expectedJSON["name"] as? String) == "restanrant"
            }
        }
    }
    
    private func jsonToData(json: [String:Any]) -> Data {
        return try! JSONSerialization.data(withJSONObject: json,
                                           options: JSONSerialization.WritingOptions.prettyPrinted)
    }
}
