//
//  DateSample.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import Foundation

protocol DateProtocol {
    func now() -> Date
}

class DateDefault: DateProtocol {
    func now() -> Date {
        return Date()
    }
}

struct MockDateProtocol: DateProtocol {
    var date: Date? = nil

    func now() -> Date {
        return date!
    }
}

class CalendarUtil {
    let dateProtocol: DateProtocol

    init(dateProtocol: DateProtocol = DateDefault()) {
        self.dateProtocol = dateProtocol
    }

    func isHoliday() -> Bool {
        let now = dateProtocol.now()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: now)
        return weekday == 1 || weekday == 7
    }
}
