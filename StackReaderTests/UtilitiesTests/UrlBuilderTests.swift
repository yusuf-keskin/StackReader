//
//  UrlBuilderTests.swift
//  StackReaderTests
//
//  Created by YUSUF KESKİN on 22.05.2023.
//

import XCTest
@testable import StackReader

final class UrlBuilderTests: XCTestCase {
    
    var sut : URLBuilder!

    override func setUpWithError() throws {
        sut = URLBuilder()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_URLBuilder_WhenPageAndTagProvided_ReturnsCorrectURL() throws {
        let expectedURL = URL(string: "https://api.stackexchange.com/2.3/questions?page=1&pagesize=40&order=asc&max=6&sort=votes&tagged=ios&site=stackoverflow&filter=!nKzQUR3Egv")
        let resultUrl = sut.buildUrl(forPage: "1", andTag : "ios")
        
        XCTAssertEqual(expectedURL, resultUrl!, "URLBuilder should return expected url when page : 1 and tag = ios provided")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
