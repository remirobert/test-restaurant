//
//  MockedNetworkDownloader.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation
@testable import lafourchette_test

internal final class MockedNetworkDownloader: Network {
    private let data: Data?
    private let error: Error?
    
    init(data: Data?, error: Error?) {
        self.data = data
        self.error = error
    }
    
    override func getData(path: String, completionRequest: @escaping CompletionGetData) {
        if let error = self.error {
            completionRequest(Result.Failure(error))
            return
        }
        guard let data = data else {
            completionRequest(Result.Failure(NetworkError.noData))
            return
        }
        completionRequest(Result<Data>.Success(data))
    }
}
