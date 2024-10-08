//
//  BasicAssertionTest.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/08.
//

import XCTest

struct Dog: Equatable {
    var name: String
    var age: Int
}

class BasicAssertionTest: XCTestCase {

    private let string = "Hello"
    private let notNumber = Int("Hello")
    private let number = Int("334")
    private let dog1 = Dog(name: "一郎", age: 51)
    private let dog2 = Dog(name: "翔平", age: 30)

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // Boolを判定する (p.64)
    func testHasPrefix() {
        XCTAssertTrue(string.hasPrefix("He"), "stringがHeから始まること、ヨシ")
        XCTAssertFalse(string.isEmpty, "stringがEmptyじゃないこと、ヨシ")
    }

    // nilを判定する (p.65)
    func testNumberValidation() {
        XCTAssertNil(notNumber, "notNumberはnilであること、ヨシ")
        XCTAssertNotNil(number, "numberはnilじゃないこと、ヨシ")
    }

    // 等値性を判定する (p.65)
    func testEqual() {
        XCTAssertEqual(string, "Hello", "stringがHelloであること、ヨシ")
        XCTAssertNotEqual(string, "Goodbye", "stringがGoodbyeではないこと、ヨシ")
    }

    // Equtable準拠 (p.66)
    func testEqutable() {
        XCTAssertNotEqual(dog1, dog2, "それぞれ違うDogであること、ヨシ")

    }

    // 大小判定 (p.69)
    func testCompareNumber() {
        XCTAssertGreaterThan(20, 10, "20は10より大きいこと、ヨシ")
        XCTAssertGreaterThanOrEqual(20, 10)
        XCTAssertGreaterThanOrEqual(334, 334, "GreaterThanOrEqualは等くてもOK、ヨシ")
        XCTAssertLessThan(10, 20, "10は20より小さい、ヨシ")
        XCTAssertLessThanOrEqual(334, 334, "LessThanOrEqualは等くてもOK、ヨシ")
    }

}
