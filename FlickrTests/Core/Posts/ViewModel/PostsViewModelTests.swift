//
//  PostsViewModelTests.swift
//  FlickrTests
//
//  Created by Eduardo Fornari on 07/06/24.
//

import XCTest
@testable import Flickr
import Combine

final class PostsViewModelTests: XCTestCase {

    private var sut: PostsViewModel!

    @MainActor override func setUp() {
        sut = PostsViewModel(service: ServiceMock())
    }

    @MainActor func testLoadData() {
        let expectation = expectation(description: "models property updated")

        // When searchText chenge
        sut.searchText = "A"

        // Then the data is updated
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            XCTAssertTrue(self.sut.models.count == 5)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5)
    }

    @MainActor func testNavigationTitle() {
        let expectedValue = "Posts"
        let value = sut.navigationTitle
        XCTAssertEqual(value, expectedValue)
    }
}
