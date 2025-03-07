//
//  RepositorySearchViewModel.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 05..
//

import Foundation
import Combine

@MainActor
class RepositorySearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var filterQuery: String = ""
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    @Published var error: Error? = nil
    
    private var cancellables: Set<AnyCancellable> = []
    private let service: GitHubServiceProtocol
    
    init(service: GitHubServiceProtocol = GitHubService()) {
        self.service = service
    }
    
    func search() {
        guard !searchQuery.isEmpty else {
            repositories.removeAll()
            return
        }
        
        isLoading = true
        error = nil
        let fullQuery = searchQuery + (filterQuery.isEmpty ? "" : " " + filterQuery)
        
        service.searchRepositories(query: fullQuery)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                if case let .failure(error) = completion {
                    self?.error = error
                }
            }, receiveValue: { [weak self] repos in
                self?.repositories = repos
            })
            .store(in: &cancellables)
    }
}
