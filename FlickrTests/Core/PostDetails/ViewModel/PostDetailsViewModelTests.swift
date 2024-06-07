//
//  PostDetailsViewModelTests.swift
//  FlickrTests
//
//  Created by Eduardo Fornari on 07/06/24.
//

import XCTest
@testable import Flickr

final class PostDetailsViewModelTests: XCTestCase {

    private let modelMock = PreviewProvider.post
    private lazy var sut = PostDetailsViewModel(model: modelMock)

    func testAuthorTitle() {
        let expectedValue = "Author: "
        let value = sut.authorTitle
        XCTAssertEqual(value, expectedValue)
    }

    func testAuthorValue() {
        let expectedValue = modelMock.author.extractAuthor()
        let value = sut.authorValue
        XCTAssertEqual(value, expectedValue)
    }

    func testDescription() {
        let expectedValue = modelMock.description.extractDescription()
        let value = sut.description
        XCTAssertEqual(value, expectedValue)
    }

    func testImageDimensionsTitle() {
        let expectedValue = "Image dimensions: "
        let value = sut.imageDimensionsTitle
        XCTAssertEqual(value, expectedValue)
    }

    func testImageDimensionsValue() {
        let expectedValue = modelMock.description.extractDimensions().string
        let value = sut.imageDimensionsValue
        XCTAssertEqual(value, expectedValue)
    }

    func testNavigationTitle() {
        let expectedValue = "Post"
        let value = sut.navigationTitle
        XCTAssertEqual(value, expectedValue)
    }

    func testPublicationDateTitle() {
        let expectedValue = "Published at: "
        let value = sut.publicationDateTitle
        XCTAssertEqual(value, expectedValue)
    }

    func testPublicationDateValue() {
        let expectedValue = modelMock.published.string()
        let value = sut.publicationDateValue
        XCTAssertEqual(value, expectedValue)
    }

    func testTitle() {
        let expectedValue = modelMock.title.trimmingCharacters(in: .whitespacesAndNewlines)
        let value = sut.title
        XCTAssertEqual(value, expectedValue)
    }

    func testImageUrl() {
        let expectedValue = URL(string: modelMock.media.url)
        let value = sut.imageUrl
        XCTAssertEqual(value, expectedValue)
    }
}
