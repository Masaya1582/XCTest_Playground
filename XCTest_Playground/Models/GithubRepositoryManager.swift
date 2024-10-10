//
//  GithubRepositoryManager.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import Foundation

class GithubRepositoryManager {
    private let client: GithubAPIClientProtocol
    private var repos: [GithubRepository]?

    var majorRepositories: [GithubRepository] {
        guard let repositories = self.repos else { return [] }
        return repositories.filter { $0.star >= 10 }
    }

    init(client: GithubAPIClientProtocol = GithubClient()) {
        self.client = client
    }

    func load(users: String, completion: @escaping() -> Void) {
        self.client.fetchRepositories(users: users) { (repositories) in
            self.repos = repositories
            completion()
        }
    }
}
