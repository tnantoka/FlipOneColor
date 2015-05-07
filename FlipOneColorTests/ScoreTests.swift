//
//  ScoreTests.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/7/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit
import XCTest

class ScoreTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        realm.deleteAllObjects()
        realm.commitWriteTransaction()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

    func testIsCleared() {
        XCTAssertTrue(Score.isNewRecord(1))
        
        let score = Score()
        score.moves = 0
        score.createdAt = NSDate()

        let realm = RLMRealm.defaultRealm()
        realm.transactionWithBlock({ () -> Void in
            realm.addObject(score)
        })

        XCTAssertFalse(Score.isNewRecord(1))
    }
}
