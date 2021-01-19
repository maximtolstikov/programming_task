//
//  DisplayedTableViewCellViewModel.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import Foundation

protocol DisplayedTableViewCellViewModel {
    func loadImage(
        _ url: URL,
        completion: @escaping DownloadImageResult
    )
}

final class DisplayedTableViewCellViewModelImp: DisplayedTableViewCellViewModel {

    // MARK: - Dependency
    
    private let networkService: NetworkService
    
    // MARK: - Init
    
    init(_ networkService: NetworkService) {
        self.networkService = networkService
    }

    // MARK: - Public methods

    func loadImage(
        _ url: URL,
        completion: @escaping DownloadImageResult
    ) {
        networkService.downloadImage(withURL: url) {
            completion($0)
        }
    }
}
