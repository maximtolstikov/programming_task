//
//  ControllersFactory.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit

protocol ControllersFactory {
    func displayedController() -> UINavigationController
}

final class ControllersFactoryImp: ControllersFactory {
    func displayedController() -> UINavigationController {
        let viewModel = DisplayedControllerViewModelImp()
        let controller = DisplayedController(viewModel)
        return UINavigationController(rootViewController: controller)
    }
}
