//
//  ControllersFactoryTest.swift
//  ProgrammingStoreTestTaskUITests
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import XCTest
@testable import ProgrammingStoreTestTask


class ControllersFactoryTest: XCTestCase {

    var factory: ControllersFactory!
    var expectedController: UIViewController!
    
    func testCraftDisplayedController() throws {
        // Given
        let factory = ControllersFactoryImp()
        // When
        let navController = factory.displayedController()
        // Then
        expectedController = navController.viewControllers.first
        XCTAssertNotNil(expectedController as? DisplayedController)
        XCTAssertTrue(expectedController is DisplayedController)
    }

}
