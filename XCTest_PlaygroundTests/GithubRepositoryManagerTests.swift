//
//  GithubRepositoryManagerTests.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import XCTest
@testable import XCTest_Playground

class GithubRepositoryManagerTests: XCTestCase {
    func testMajorRepositories() {
        let testRepositories: [GithubRepository] = [
            GithubRepository(id: 0, star: 9, name: ""),
            GithubRepository(id: 1, star: 10, name: ""),
            GithubRepository(id: 2, star: 11, name: ""),
        ]

        let mockClient = MockGithubAPIClient(repositories: testRepositories)
        let manager = GithubRepositoryManager(client: mockClient)
        manager.load(users: "apple") {
            XCTAssertEqual(mockClient.argsUser, "apple")
            XCTAssertEqual(manager.majorRepositories.count, 2)
            XCTAssertEqual(manager.majorRepositories[0].id, 1)
            XCTAssertEqual(manager.majorRepositories[1].id, 2)
        }
    }
}
