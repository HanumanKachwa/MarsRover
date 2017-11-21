//
//  MarsRoverTests.swift
//  MarsRoverTests
//
//  Created by Hanuman on 21/11/17.
//  Copyright © 2017 Hanuman. All rights reserved.
//

import XCTest
@testable import MarsRover

class MarsRoverTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRoverSuccess() {
        let viewModel = MarsRoverViewModel()
        let userInput = """
                        5 5
                        1 2 N
                        LMLMLMLMM
                        3 3 E
                        MMRMMRMRRM
                        """
        let expectedUserOutput = """
                                    1 3 N
                                    5 1 E\n
                                    """
        let userOutput = viewModel.processUserData(input: userInput)
        XCTAssertEqual(userOutput, expectedUserOutput)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
