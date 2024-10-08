//
//  FailureTest.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/08.
//

import XCTest
@testable import XCTest_Playground

class FailureTest: XCTestCase {

    var failure: Failure!
    let string1: String = "Hello"
    let string2: String? = "Hello"

    override func setUp() {
        super.setUp()
        self.failure = Failure()
    }

    override func tearDown() {
        super.tearDown()
    }

    // 意図的に失敗させる (p.70)
    func testClosure() {
        failure.executeClosure(false) {
            XCTFail("conditionがfalseの場合はクロージャが呼び出されないこと、ヨシ")
        }

    }

    // 例外を判定する (p.71)
    func testThrowsError() {
        XCTAssertThrowsError(try failure.downloadContent(connectionFailed: true)) { (error: Error) -> Void in
            XCTAssertEqual(error as? DownloadError, DownloadError.connectionError, "connectionFailed = trueの時はconnectionErrorが返されること、ヨシ")
        }
    }

    // 例外検証その２ (p.73)
    func testSystemError() {
        XCTAssertThrowsError(try failure.throwSystemError()) { (error: Error) -> Void in
            // throwされた例外errorがSystemErrorにキャストできることを検証
            guard let systemError = error as? SystemError else {
                XCTFail()
                return
            }

            // messageプロパティの値が期待値と一致するか検証
            XCTAssertEqual(systemError.message, "memory access error", "SystemErrorのmessageがmemory access errorになること、ヨシ")
        }
    }

    // 型Tと型Optional<T>は比較できる (p.75)
    func testOptionalComparison() {
        XCTAssertEqual(string1, string2, "型Tと型Optional<T>は比較できる、ヨシ")

    }
}
