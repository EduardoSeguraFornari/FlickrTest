//
//  FlickrTests.swift
//  FlickrTests
//
//  Created by Eduardo Fornari on 06/06/24.
//

import XCTest
@testable import Flickr

final class StringExtensionsTests: XCTestCase {

    private let descriptionMock = "<p><a href=\"https://www.flickr.com/people/photosbyblackwolf/\">Dan King Alaskan Photography</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/photosbyblackwolf/53762634202/\" title=\"Porcupine Portrait\"><img src=\"https://live.staticflickr.com/65535/53762634202_b9bd80c596_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine Portrait\" /></a></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p>"
    private let authorMock = "nobody@flickr.com (\"ZoomZoom Du Buisson\")"

    func testDate() {
        let dateString = "2024-12-31"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString) ?? Date()

        let expectedValue = date
        let value = dateString.date(with: "yyyy-MM-dd")
        XCTAssertEqual(value, expectedValue)
    }

    func testExtractAuthor() {
        let expectedValue = "ZoomZoom Du Buisson"
        let value = authorMock.extractAuthor()
        XCTAssertEqual(value, expectedValue)
    }

    func testExtractDescription() {
        let expectedValue = "I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face.\nPorcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.\nPorcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.\nPorcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark."
        let value = descriptionMock.extractDescription()
        XCTAssertEqual(value, expectedValue)
    }

    func testExtractDimensions() {
        let expectedValue = CGSize(width: 240, height: 160)
        let value = descriptionMock.extractDimensions()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveHrefs() {
        let expectedValue = "<p><a >Dan King Alaskan Photography</a> posted a photo:</p> <p><a  title=\"Porcupine Portrait\"><img src=\"https://live.staticflickr.com/65535/53762634202_b9bd80c596_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine Portrait\" /></a></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p>"
        let value = descriptionMock.removeHrefs()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveImgTags() {
        let expectedValue = "<p><a href=\"https://www.flickr.com/people/photosbyblackwolf/\">Dan King Alaskan Photography</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/photosbyblackwolf/53762634202/\" title=\"Porcupine Portrait\"></a></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p>"
        let value = descriptionMock.removeImgTags()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveATagMarks() {
        let expectedValue = "<p><a href=\"https://www.flickr.com/people/photosbyblackwolf/\">Dan King Alaskan Photography posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/photosbyblackwolf/53762634202/\" title=\"Porcupine Portrait\"><img src=\"https://live.staticflickr.com/65535/53762634202_b9bd80c596_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine Portrait\" /></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p>"
        let value = descriptionMock.removeATagMarks()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveATagsWithTitle() {
        let expectedValue = "<p><a href=\"https://www.flickr.com/people/photosbyblackwolf/\">Dan King Alaskan Photography</a> posted a photo:</p> <p></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p>"
        let value = descriptionMock.removeATagsWithTitle()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveFirstPTag() {
        let expectedValue = " <p><a href=\"https://www.flickr.com/photos/photosbyblackwolf/53762634202/\" title=\"Porcupine Portrait\"><img src=\"https://live.staticflickr.com/65535/53762634202_b9bd80c596_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine Portrait\" /></a></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p>"
        let value = descriptionMock.removeFirstPTag()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveMultipleCharCase1() {
        let expectedValue = " "
        let value = "     ".removeMultiple(char: " ")
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveMultipleCharCase2() {
        let expectedValue = ","
        let value = ",,,,,".removeMultiple(char: ",")
        XCTAssertEqual(value, expectedValue)
    }

    func testRemovePTagMarks() {
        let expectedValue = "<a href=\"https://www.flickr.com/people/photosbyblackwolf/\">Dan King Alaskan Photography</a> posted a photo: <a href=\"https://www.flickr.com/photos/photosbyblackwolf/53762634202/\" title=\"Porcupine Portrait\"><img src=\"https://live.staticflickr.com/65535/53762634202_b9bd80c596_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine Portrait\" /></a> I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark."
        let value = descriptionMock.removePTagMarks()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveSpacesAroundNewlinesCase1() {
        let expectedValue = "a\na"
        let value = "a \n a".removeSpacesAroundNewlines()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveSpacesAroundNewlinesCase2() {
        let expectedValue = "a\na"
        let value = "a\n a".removeSpacesAroundNewlines()
        XCTAssertEqual(value, expectedValue)
    }

    func testRemoveSpacesAroundNewlinesCase3() {
        let expectedValue = "a\na"
        let value = "a \na".removeSpacesAroundNewlines()
        XCTAssertEqual(value, expectedValue)
    }

    func testReplaceBrWithNewline() {
        let expectedValue = "<p><a href=\"https://www.flickr.com/people/photosbyblackwolf/\">Dan King Alaskan Photography</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/photosbyblackwolf/53762634202/\" title=\"Porcupine Portrait\"><img src=\"https://live.staticflickr.com/65535/53762634202_b9bd80c596_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine Portrait\" /></a></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. \n Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.\n Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.\n Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p>"
        let value = descriptionMock.replaceBrWithNewline()
        XCTAssertEqual(value, expectedValue)
    }
}
