//
//  NetworkService.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit

typealias DownloadImageResult = (Result<Data, Error>) -> Void

protocol NetworkService {
    // TODO - Реализация задания здесь!
    // Отдельный поток создаю во вью модели.
    func downloadImage(
        withURL url: URL,
        completion: @escaping DownloadImageResult
    )
}

final class NetworkServiceImp: NetworkService {
    func downloadImage(
        withURL url: URL,
        completion: @escaping DownloadImageResult
    ) {
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch let error {
            completion(.failure(error))
        }
    }
}
