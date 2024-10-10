//
//  GithubClient.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import Foundation

protocol GithubAPIClientProtocol {
    func fetchRepositories(users: String, handler: @escaping([GithubRepository]?) -> Void)
}

class GithubClient: GithubAPIClientProtocol {
    func fetchRepositories(users: String, handler: @escaping([GithubRepository]?) -> Void) {

        let url = URL(string: "https://api.github.com/users/\(users)/repos")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                handler(nil)
                return
            }
            let repos = try! JSONDecoder().decode([GithubRepository].self, from: data)
            DispatchQueue.main.async {
                handler(repos)
            }
        }
        task.resume()
    }
}

class MockGithubAPIClient: GithubAPIClientProtocol {
    var returnRepositories: [GithubRepository]
    var argsUser: String?

    init(repositories: [GithubRepository]) {
        self.returnRepositories = repositories
    }

    func fetchRepositories(users: String, handler: @escaping ([GithubRepository]?) -> Void) {
        self.argsUser = users
    }
}
