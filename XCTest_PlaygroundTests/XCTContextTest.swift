//
//  XCTContextTest.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import XCTest

func safeDivision(_ x: Int, _ y: Int) -> Int? {
    if y == 0 {
        return nil
    } else {
        return x / y
    }
}

// RunActivityのお勉強 (p.85)
class XCTContextTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSafeDivision() {
        // 通常の割り算
        XCTAssertEqual(safeDivision(6, 3), 2, "6 / 3 = 2であること、ヨシ")

        // 0除算
        XCTAssertNil(safeDivision(334, 0), "0で割る時はnilになること、ヨシ")
    }

    // RunActivityを使用する場合
    func testSafeDivisionRunActivity() {
        XCTContext.runActivity(named: "通常の割り算") { _ in
            XCTAssertEqual(safeDivision(6, 3), 2, "6 / 3 = 2であること、ヨシ")
        }

        XCTContext.runActivity(named: "0除算") { _ in
            XCTAssertNil(safeDivision(334, 0), "0で割る時はnilになること、ヨシ")
        }

    }
}
