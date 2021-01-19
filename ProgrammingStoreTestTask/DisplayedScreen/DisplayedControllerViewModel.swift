//
//  DisplayedControllerViewModel.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import Foundation

protocol DisplayedControllerViewModel {
    var tableView: DisplayedTableView { get }
    
    func loadData(for size: ImageSize)
}

final class DisplayedControllerViewModelImp: DisplayedControllerViewModel {
    
    // MARK: - Dependency
    
    private let endpointHelper = EndpointHelper()

    // MARK: - Public properties
    
    let tableView = DisplayedTableView()

    // MARK: - Public methods
    
    func loadData(for size: ImageSize) {
        tableView.data = Array<Int>(0..<100)
            .compactMap { _ in endpointHelper.url(size) }
    }

}
