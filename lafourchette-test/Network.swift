//
//  Network.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func getItem(path: String, completionRequest: @escaping CompletionGetItem)
}

typealias JSON = [String:Any]
typealias CompletionGetItem = (Result<JSON>) -> Void

enum NetworkError: Error {
    case noData
    case invalidURL
    case parseJSONError
}

final class Network {
    fileprivate let endPoint: String
    fileprivate let session: URLSession
    
    init(endPoint: String, session: URLSession = URLSession.shared) {
        self.endPoint = endPoint
        self.session = session
    }
}

extension Network: NetworkProtocol {
    func getItem(path: String, completionRequest: @escaping CompletionGetItem) {
        let absolutePath = "\(endPoint)\(path)"
        guard let url = URL(string: absolutePath) else {
            completionRequest(Result.Failure(NetworkError.invalidURL))
            return
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completionRequest(Result.Failure(error))
            }
            guard let data = data else {
                completionRequest(Result.Failure(NetworkError.noData))
                return
            }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                let json = jsonData as! JSON
                completionRequest(Result<JSON>.Success(json))
            } catch {
                completionRequest(Result.Failure(NetworkError.parseJSONError))
            }
        }
        task.resume()
    }
}
