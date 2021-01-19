//
//  DisplayedController.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit

class DisplayedController: UIViewController {

    // MARK: - Override properties

    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - Private properties
    
    private let viewModel: DisplayedControllerViewModel
    
    // MARK: - Init
    
    init(_ viewModel: DisplayedControllerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentImages()
    }

    // MARK: - Configuration
    
    private func configure() {
        title = Configuration.displayedScreenTitle
        configureTableView()
    }
    
    private func configureTableView() {
        let tableView = viewModel.tableView
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Private methods
    
    private func presentImages() {
        let screenWidth = UIScreen.main.bounds.width
        let tableViewCellHeight = viewModel.tableView.rowHeight
        let imageSize = (Int(screenWidth), Int(tableViewCellHeight))
        viewModel.loadData(for: imageSize)
    }

}
