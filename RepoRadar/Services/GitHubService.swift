//
//  GitHubService.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 05..
//

import Foundation
import Combine

class GitHubService: GitHubServiceProtocol {
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func searchRepositories(query: String) -> AnyPublisher<[Repository], Error> {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
        let url = URL(string: "https://api.github.com/search/repositories?q=\(encodedQuery)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: SearchResponse.self, decoder: jsonDecoder)
            .map { $0.items }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
