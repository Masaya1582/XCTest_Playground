//
//  OriginalAssertion.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import XCTest

// 独自のAssertion (p.79)
func assertEmpty(_ string: String, file: StaticString = #file, line: UInt = #line) {
    XCTAssert(string.isEmpty, "\"\(string)\" is not empty)", file: file, line: line)
}

class OriginalAssertionTests: XCTestCase {
    func testAssertEmpty() {
        let string = "Hello" // 失敗させる場合 (assertEmptyのfileとline引数を使うことでこっちにエラーが表示されるようになる)
        assertEmpty(string)
    }
}
