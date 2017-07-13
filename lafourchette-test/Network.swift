//
//  Network.swift
//  lafourchette-test
//
//  Created by Rémi Robert on 11/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func getData(path: String, completionRequest: @escaping CompletionGetData)
}

typealias JSON = [String:Any]
typealias CompletionGetData = (Result<Data>) -> Void

enum NetworkError: Error {
    case noData
    case invalidURL
}

class Network: NetworkProtocol {
    fileprivate let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getData(path: String, completionRequest: @escaping CompletionGetData) {
        guard let url = URL(string: path) else {
            completionRequest(Result.Failure(NetworkError.invalidURL))
            return
        }
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completionRequest(Result.Failure(error))
                return
            }
            guard let data = data else {
                completionRequest(Result.Failure(NetworkError.noData))
                return
            }
            completionRequest(Result<Data>.Success(data))
        }
        task.resume()
    }
}
