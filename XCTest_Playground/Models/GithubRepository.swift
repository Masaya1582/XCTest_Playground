//
//  GithubRepository.swift
//  XCTest_Playground
//
//  Created by MasayaNakakuki on 2024/10/10.
//

import Foundation

struct GithubRepository: Decodable, Equatable {
    let id: Int
    let star: Int
    let name: String

    enum CodinyKeys: String, CodingKey {
        case id
        case star = "stargazers_count"
        case name
    }
}
