//
//  DisplayedTableViewCell.swift
//  ProgrammingStoreTestTask
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import UIKit

class DisplayedTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var placeholder: UIImageView!

    // MARK: - Public properties
    
    static let reuseId = "DisplayedTableViewCell"
    var imageUrl: URL? {
        didSet {
            loadImage()
        }
    }
    
    // MARK: - Private properties
    
    private var viewModel: DisplayedTableViewCellViewModel?

    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let networkService = NetworkServiceImp()
        viewModel = DisplayedTableViewCellViewModelImp(networkService)
    }

    // MARK: - Private methods
    
    private func loadImage() {
        assert(imageUrl != nil, "Arrive the nil instead url in a cell!")
        guard let unwrappedUrl = imageUrl else { return }
        
        let queue = DispatchQueue(
            label: unwrappedUrl.absoluteString,
            qos: .userInitiated,
            attributes: .concurrent
        )
        
        queue.async {
            self.viewModel?.loadImage(unwrappedUrl) { [weak self] (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.placeholder.image = UIImage(data: data)
                    case .failure(let error):
                        print(error.localizedDescription)
                        self?.setErrorLabel()
                    }
                }
            }
        }
        
    }
    
    private func setErrorLabel() {
        // FIXME: - Add a release!
    }
 
}
