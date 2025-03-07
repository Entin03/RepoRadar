//
//  GitHubServiceProtocol.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 05..
//

import Foundation
import Combine

protocol GitHubServiceProtocol {
    func searchRepositories(query: String) -> AnyPublisher<[Repository], Error>
}
