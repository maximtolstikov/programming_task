//
//  DisplayedTableViewCellViewModelTest.swift
//  ProgrammingStoreTestTaskTests
//
//  Created by Maxim Tolstikov on 20.01.2021.
//

import XCTest
@testable import ProgrammingStoreTestTask

class DisplayedTableViewCellViewModelTest: XCTestCase {
    
    var networkService: NetworkService!
    var viewModel: DisplayedTableViewCellViewModel!
    var expectedImage: UIImage!

    override func setUpWithError() throws {
        networkService = NetworkServiceMock()
        viewModel = DisplayedTableViewCellViewModelImp(networkService)
    }

    override func tearDownWithError() throws {
        networkService = nil
        viewModel = nil
        expectedImage = nil
    }
    
    func testLoadImage() throws {
        // Given
        let rightURL = URL(string: "https://via.placeholder.com/200x100/ffffff")
        let expectation = self.expectation(description: #function)
        // When
        viewModel.loadImage(rightURL!) { [weak self] (result) in
            expectation.fulfill()
            let data = try! result.get()
            self?.expectedImage = UIImage(data: data)
        }
        // Then
        waitForExpectations(timeout: 2.0, handler: nil)
        XCTAssertNotNil(expectedImage, "The image can't received!")
    }


}
