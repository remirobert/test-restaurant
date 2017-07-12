//
//  NetworkTests.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import lafourchette_test

enum TestError: Error {
    case networkError
}

class NetworkTests: QuickSpec {
    override func spec() {
        describe("NetworkTests") {
            it("with invalid url, should return the right error") {
                let mockedUrlSession = MockedUrlSession(data: nil, error: TestError.networkError)
                let network = Network(session: mockedUrlSession)
                var expectedError: Error!
                var expectedData: Data!

                network.getData(path: "y u tu be", completionRequest: { result in
                    switch result {
                    case .Success(let data):
                        expectedData = data
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).to(matchError(NetworkError.invalidURL))
                expect(expectedData).to(beNil())
            }
            it("with a url session error, should return the right error") {
                let mockedUrlSession = MockedUrlSession(data: nil, error: TestError.networkError)
                let network = Network(session: mockedUrlSession)
                var expectedError: Error!
                var expectedData: Data!

                network.getData(path: "https://www.youtube.com", completionRequest: { result in
                    switch result {
                    case .Success(let data):
                        expectedData = data
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).to(matchError(TestError.networkError))
                expect(expectedData).to(beNil())
            }
            it("with no data, should return an invalid data error") {
                let mockedUrlSession = MockedUrlSession(data: nil, error: nil)
                let network = Network(session: mockedUrlSession)
                var expectedError: Error!
                var expectedData: Data!

                network.getData(path: "https://www.youtube.com", completionRequest: { result in
                    switch result {
                    case .Success(let data):
                        expectedData = data
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).to(matchError(NetworkError.noData))
                expect(expectedData).to(beNil())
            }
            it("with correct data, should return the exact same data") {
                let data = UIImageJPEGRepresentation(UIImage(named: "image")!, 1)!
                let mockedUrlSession = MockedUrlSession(data: data, error: nil)
                let network = Network(session: mockedUrlSession)
                var expectedError: Error!
                var expectedData: Data!

                network.getData(path: "https://www.youtube.com", completionRequest: { result in
                    switch result {
                    case .Success(let data):
                        expectedData = data
                    case .Failure(let error):
                        expectedError = error
                    }
                })
                expect(expectedError).to(beNil())
                expect(expectedData).to(be(data))
            }
        }
    }
}

internal final class MockedUrlSession: URLSession {
    private let data: Data?
    private let error: Error?

    internal class StubSessionDataTask: URLSessionDataTask {
        override func resume() {
        }
    }

    init(data: Data?, error: Error?) {
        self.data = data
        self.error = error
    }

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        completionHandler(self.data, nil, self.error)
        return StubSessionDataTask()
    }
}

