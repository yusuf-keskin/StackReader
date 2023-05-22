//
//  LaunchVCTest.swift
//  StackReaderTests
//
//  Created by YUSUF KESKİN on 22.05.2023.
//

import XCTest
@testable import StackReader

final class LaunchVCTest: XCTestCase {
    
    var sut : LaunchVC!
    var board : UIStoryboard!

    override func setUpWithError() throws {
        board = UIStoryboard(name: "Main", bundle: nil)
        sut = board.instantiateViewController(withIdentifier: "LaunchVC") as? LaunchVC
    }

    override func tearDownWithError() throws {
        sut = nil
        board = nil
    }

    func test_LaunchVC_WhenLoaded_launchTitle_isStackReader() throws {
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.launchTitle.text, "StackReader")
    }
    
    func test_LaunchVC_WhenLoaded_launchTitleOutletIsConnected() throws {
        sut.loadViewIfNeeded()
        let titleLabel = try XCTUnwrap(sut.launchTitle, "launchTitle outlet connection is broken")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
