//
//  ImageDownloader.swift
//  lafourchette-test
//
//  Created by Remi Robert on 12/07/2017.
//  Copyright © 2017 Remi Robert. All rights reserved.
//

import UIKit

protocol ImageDownloader {
    func getImage(path: String, completionRequest: @escaping CompletionGetImage)
}

typealias CompletionGetImage = (Result<UIImage>) -> Void

enum ImageDownloaderError: Error {
    case errorData
}

extension Network: ImageDownloader {
    func getImage(path: String, completionRequest: @escaping CompletionGetImage) {
        getData(path: path) { result in
            switch result {
            case .Success(let data):
                guard let image = UIImage(data: data) else {
                    completionRequest(Result.Failure(ImageDownloaderError.errorData))
                    return
                }
                completionRequest(Result<UIImage>.Success(image))
            case .Failure(let error):
                completionRequest(Result.Failure(error))
            }
        }
    }
}
