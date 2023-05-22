//
//  DateConverterTests.swift
//  StackReaderTests
//
//  Created by YUSUF KESKİN on 22.05.2023.
//

import XCTest
@testable import StackReader

final class DateConverterTests: XCTestCase {
    
    var sut : DateConverter!
    var stubDateInt : Int!

    override func setUpWithError() throws {
        stubDateInt = 1546909833
        sut = DateConverter()
    }

    override func tearDownWithError() throws {
        sut = nil
        stubDateInt = nil
    }

    func test_DateConverter_WhenDateProvidedAsInteger_ReturnsDateAsCorrectStringFormat() throws {
        let date = sut.convertDateToEpoc(fromInt: stubDateInt)
        let dateString = "2019-01-08 01:10:33"
        XCTAssertEqual(date, dateString, "String Date for stub Int value shopuld be 2019-01-08 01:10:33 ")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
