//
//  JSONDownloader.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation

protocol JSONDownloader {
    func getJSON(path: String, completionRequest: @escaping CompletionGetJSON)
}

typealias CompletionGetJSON = (Result<JSON>) -> Void

enum JSONDownloaderError: Error {
    case parseJSONError
}

extension Network: JSONDownloader {
    func getJSON(path: String, completionRequest: @escaping CompletionGetJSON) {
        getData(path: path) { result in
            switch result {
            case .Success(let data):
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                    let json = jsonData as! JSON
                    completionRequest(Result<JSON>.Success(json))
                } catch {
                    completionRequest(Result.Failure(JSONDownloaderError.parseJSONError))
                }
            case .Failure(let error):
                completionRequest(Result.Failure(error))
            }
        }
    }
}
