//
//  LightsOutTests.swift
//  FlipOneColor
//
//  Created by Tatsuya Tobioka on 5/6/15.
//  Copyright (c) 2015 tnantoka. All rights reserved.
//

import UIKit
import XCTest

class LightsOutTests: XCTestCase {

    var lightsOut: LightsOut!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.lightsOut = LightsOut()
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

    func testToggleLight() {
        for light in lightsOut.lights {
            light.on = false
        }
        let light = lightsOut.lights[6]
        
        let left = light.left!.on
        let right = light.right!.on
        let up = light.up!.on
        let down = light.down!.on
        
        lightsOut.toggleLight(light)
        
        XCTAssertEqual(!left, light.left!.on)
        XCTAssertEqual(!right, light.right!.on)
        XCTAssertEqual(!up, light.up!.on)
        XCTAssertEqual(!down, light.down!.on)
    }

    func testIsCleared() {
        XCTAssertFalse(lightsOut.isCleared())
        for light in lightsOut.lights {
            light.on = true
        }
        XCTAssertTrue(lightsOut.isCleared())
    }

}
