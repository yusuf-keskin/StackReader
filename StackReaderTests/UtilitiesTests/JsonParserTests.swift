//
//  JsonParserTests.swift
//  StackReaderTests
//
//  Created by YUSUF KESKİN on 22.05.2023.
//

import XCTest
@testable import StackReader

final class JsonParserTests: XCTestCase {
    var sut : JsonDecoderProtocol!
    
    var mockDataProvider : JsonParserMockDataProvider!
    var imageDownloaderMock : MockImageDownloader!
    var dateConverterMock : DateConverterProtocol!

    override func setUpWithError() throws {
        mockDataProvider = JsonParserMockDataProvider()
        dateConverterMock = MockDateConverter()
        imageDownloaderMock = MockImageDownloader()
        sut = JsonParser(downloader: imageDownloaderMock, dateConverter: dateConverterMock)
    }

    override func tearDownWithError() throws {
        mockDataProvider = nil
        dateConverterMock = nil
        imageDownloaderMock = nil
        sut = nil
    }

    func test_JsonParser_WhenDataProvided_CanDecodeDataToModel() throws {
        let data = mockDataProvider.loadStub(name: "ApiResponseStub", dataExtension: "json")
        let objects = sut.decodeApiResponse(withData: data)
        XCTAssertFalse(objects.isEmpty, "Objects shouldn't be empty if json decode is successful")
    }
    
    func test_JsonParser_WhenDataProvided_ImageDownloaderIsCalled() throws {
        let data = mockDataProvider.loadStub(name: "ApiResponseStub", dataExtension: "json")
        let _ = sut.decodeApiResponse(withData: data)
        XCTAssertTrue(imageDownloaderMock.isImageDownloaderCalled, "When json parser is called, image downloader also should be called")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
