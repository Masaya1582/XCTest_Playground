//
//  TestLifeCycle.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import XCTest

// ライフサイクルサンプル (p.82)
class LifeCycleTests: XCTestCase {
    override class func setUp() {
        print("Setup (class)")
    }

    override class func tearDown() {
        print("TearDown (class)")
    }

    override func setUp() {
        print("Setup")
    }

    override func tearDown() {
        print("TearDown")
    }

    func test1() {
        print("<test1>")
    }

    func test2() {
        print("<test2>")
    }
}
