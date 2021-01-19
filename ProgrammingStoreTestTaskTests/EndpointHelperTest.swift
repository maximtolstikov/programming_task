//
//  EndpointHelper.swift
//  ProgrammingStoreTestTaskTests
//
//  Created by Maxim Tolstikov on 19.01.2021.
//

import XCTest
@testable import ProgrammingStoreTestTask

class EndpointHelperTest: XCTestCase {
    
    var helper: EndpointHelper!
    let rightURL = URL(string: "https://via.placeholder.com/200x100/ffffff")
    var expectedURL: URL!

    override func setUpWithError() throws {
        helper = EndpointHelper()
    }

    override func tearDownWithError() throws {
        helper = nil
    }

    func testUrl() throws {
        // Given
        let whiteColor = UIColor.white
        // When
        expectedURL = helper.url((200, 100), whiteColor)
        // Then
        XCTAssertTrue(expectedURL! == rightURL!)
    }

}
