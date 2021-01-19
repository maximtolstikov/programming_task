//
//  DisplayedTableView.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit

class DisplayedTableView: UITableView {

    // MARK: - Public properties
    
    var data = [URL]() {
        didSet {
            reloadData()
        }
    }

    // MARK: - Init
    
    init() {
        super.init(frame: .zero, style: .grouped)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration
    
    private func configure() {
        dataSource = self
        rowHeight = 100.0
        register(
            UINib(nibName: DisplayedTableViewCell.reuseId, bundle: nil),
            forCellReuseIdentifier: DisplayedTableViewCell.reuseId
        )
        separatorStyle = .none
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        showsVerticalScrollIndicator = false
    }
}

// MARK: - UITableViewDataSource

extension DisplayedTableView: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        data.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DisplayedTableViewCell.reuseId,
                for: indexPath
        ) as? DisplayedTableViewCell
        else { return UITableViewCell() }
        cell.imageUrl = data[indexPath.row]
        return cell
    }
    
    
}
