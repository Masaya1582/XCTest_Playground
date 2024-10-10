//
//  DateTest.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import XCTest

// 単体テストが書きづらいケース (Bad)
func isHoliday() -> Bool {
    let now = Date() // 現在時刻が実行時に毎回変化してしまう
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: now)

    // 日曜 or 土曜でTrue
    return weekday == 1 || weekday == 7
}

// Goodバージョン (デフォルト引数を渡す)
func isHoliday2(_ date: Date = Date()) -> Bool {
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: date)

    // 日曜 or 土曜でTrue
    return weekday == 1 || weekday == 7
}

class DateTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // 平日にしか動かない (BADケース)
    func testIsWorkdayBad() {
        XCTAssertFalse(isHoliday())
    }

    // Goodバージョン
    func testIsHolidayGood() {
        // 日付文字列からDateを生成できる
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"

        var date: Date!

        // 境界値となる曜日を対象でテストコードを書く
        // 日曜日
        date = formatter.date(from: "2019/01/06")
        XCTAssertTrue(isHoliday2(date))

        // 月曜日
        date = formatter.date(from: "2019/01/07")
        XCTAssertFalse(isHoliday2(date))
    }
}
