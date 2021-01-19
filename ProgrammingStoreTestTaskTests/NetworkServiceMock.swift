//
//  NetworkServiceMock.swift
//  ProgrammingStoreTestTaskTests
//
//  Created by Maxim Tolstikov on 20.01.2021.
//

import UIKit
@testable import ProgrammingStoreTestTask

final class NetworkServiceMock: NetworkService {
    func downloadImage(
        withURL url: URL,
        completion: @escaping DownloadImageResult
    ) {
        let bundle = Bundle(for: NetworkServiceMock.self)
        let image = UIImage(named: "testImage", in: bundle, compatibleWith: nil)
        sleep(1)
        completion(.success(image!.pngData()!))
    }
    
    
}
