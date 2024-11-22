//
//  Failure.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/08.
//

import Foundation

enum DownloadError: Error, Equatable {
    case connectionError
    case unknownError(code: Int)
}

struct SystemError: Error {
    let message: String
}

final class Failure {
    func executeClosure(_ condition: Bool, handler: () -> Void) {
        if condition {
            handler()
        }
    }

    func downloadContent(connectionFailed: Bool) throws {
        if connectionFailed {
            throw DownloadError.connectionError
        } else {
            throw DownloadError.unknownError(code: 334)
        }
    }

    func throwSystemError() throws {
        throw SystemError(message: "memory access error")
    }
}
