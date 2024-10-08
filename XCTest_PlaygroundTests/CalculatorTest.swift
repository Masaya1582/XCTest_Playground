//
//  CalculatorTest.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/08.
//

import XCTest
@testable import XCTest_Playground

class CalculatorTests: XCTestCase {

    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
    }

    override class func tearDown() {
        super.tearDown()
    }

    func testAdd() {
        XCTAssertEqual(calculator.add(1, 2), 3, "1 + 2 = 3であること、ヨシ")
    }

    func testSubtract() {
        XCTAssertEqual(calculator.subtract(3, 1), 2, "3 - 1 = 2であること、ヨシ")
    }

    func testMultiple() {
        XCTAssertEqual(calculator.multiple(2, 3), 6, "2 × 3 = 6であること、ヨシ")
    }

    func testDivision() {
        XCTAssertEqual(calculator.division(334, 334), 1, "334 / 334 = 1であること、ヨシ")
    }
}
