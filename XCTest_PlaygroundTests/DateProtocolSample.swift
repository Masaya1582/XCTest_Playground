//
//  DateProtocolSample.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import XCTest
@testable import XCTest_Playground

class CalendarUtilTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIsHoliday() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"

        var mock = MockDateProtocol()

        mock.date = formatter.date(from: "2019/01/06")
        XCTAssertTrue(CalendarUtil(dateProtocol: mock).isHoliday())

        mock.date = formatter.date(from: "2019/01/07")
        XCTAssertFalse(CalendarUtil(dateProtocol: mock).isHoliday())
    }

}
