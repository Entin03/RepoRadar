//
//  FakeGitHubService.swift
//  RepoRadarTests
//
//  Created by Valentin Taradaj on 2025. 03. 06..
//

import Foundation
import Combine
@testable import RepoRadar

class FakeGitHubService: GitHubServiceProtocol {
    var repositories: [Repository] = []
    var error: Error? = nil
    
    func searchRepositories(query: String) -> AnyPublisher<[Repository], Error> {
        if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return Just(repositories)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
