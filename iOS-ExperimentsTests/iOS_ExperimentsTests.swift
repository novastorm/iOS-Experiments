//
//  iOS_ExperimentsTests.swift
//  iOS-ExperimentsTests
//
//  Created by Adland Lee on 11/14/17.
//  Copyright © 2017 4MFD. All rights reserved.
//

import XCTest
@testable import iOS_Experiments

class iOS_ExperimentsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 18441, "allWords is not 18441")
    }
    
    func testWordCountsAreCorrect() {
        let playData = PlayData()
        XCTAssertEqual(playData.wordCounts.count(for: "home"), 174, "home does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "fun"), 4, "fun does not appear 4 times")
        XCTAssertEqual(playData.wordCounts.count(for: "mortal"), 41, "mortal does not appear 41 times")
    }
    
    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
}
