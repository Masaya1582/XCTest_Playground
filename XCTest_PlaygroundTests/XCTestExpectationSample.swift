//
//  XCTestExpectationSample.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import XCTest

func echo(message: String, _ handler: @escaping(String) -> Void) {
    DispatchQueue.global().async {
        // 3秒待機
        Thread.sleep(forTimeInterval: 3)

        // 末尾に!をつけてコールバック呼び出し
        DispatchQueue.main.async {
            handler("\(message)!")
        }
    }
}

class XCTestExpectationSample: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // 間違ったコード
    func testEcho() {
        echo(message: "Hello") { (message) in
            XCTAssertEqual(message, "Hello!") // 末尾に!がついていることを検証
        }
    }

    // 間違ったコード2
    func testEcho2() {
        echo(message: "Hello") { (message) in
            XCTFail()
        }
    }

    // 正しいテスト
    func testEcho3() {
        let exp: XCTestExpectation = expectation(description: "Wait for Finish")

        echo(message: "Hello") { (message) in
            XCTAssertEqual(message, "Hello!")

            // expの待機を解除
            exp.fulfill()
        }

        // expに対してfulfill()が呼び出されるまで待機 (5秒でタイムアウト)
        wait(for: [exp], timeout: 5)
    }
}
