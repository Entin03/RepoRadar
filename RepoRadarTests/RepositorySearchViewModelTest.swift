//
//  RepositorySearchViewModelTest1.swift
//  RepoRadarTests
//
//  Created by Valentin Taradaj on 2025. 03. 06..
//

import XCTest
import Combine
@testable import RepoRadar

@MainActor
final class RepositorySearchViewModelTest: XCTestCase {
    var viewModel: RepositorySearchViewModel!
    var fakeService: FakeGitHubService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        fakeService = FakeGitHubService()
        viewModel = RepositorySearchViewModel(service: fakeService)
        cancellables = []
    }
    
    override func tearDown() {
        cancellables = nil
        viewModel = nil
        fakeService = nil
        super.tearDown()
    }
    
    func testSuccessFullSearch() {
        let sampleRepo = Repository(
            id: 1,
            name: "SampleRepo",
            fullName: "user/SampleRepo",
            description: "Repository description",
            stargazersCount: 100,
            forksCount: 10,
            createdAt: Date(),
            updatedAt: Date(),
            owner: Owner(id: 1, login: "user", avatarUrl: "https://example.com/avatar.png", htmlUrl: "https://github.com/user")
        )
        fakeService.repositories = [sampleRepo]
        viewModel.searchQuery = "Sample"
        
        let expectation = XCTestExpectation(description: "Search completes")
        
        viewModel.$repositories
            .dropFirst() // Ignore initial value
            .sink { repos in
                XCTAssertEqual(repos.count, 1)
                XCTAssertEqual(repos.first?.name, "SampleRepo")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.search()
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testSearchFailure() {
        fakeService.error = URLError(.badServerResponse)
        viewModel.searchQuery = "Sample"
        
        let expectation = XCTestExpectation(description: "Error is set")
        
        viewModel.$error
            .dropFirst() // Ignore initial nil value
            .sink { error in
                if let error = error {
                    XCTAssertEqual((error as? URLError)?.code, .badServerResponse)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.search()
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testEmptySearchQueryRemovesRepositories() {
        viewModel.repositories = [Repository(id: 1, name: "SampleRepo", fullName: "user/SampleRepo", description: nil, stargazersCount: 0, forksCount: 0, createdAt: Date(), updatedAt: Date(), owner: Owner(id: 1, login: "user", avatarUrl: "", htmlUrl: ""))]
        viewModel.searchQuery = ""
        
        let expectation = XCTestExpectation(description: "Repositories are removed on empty search")
        
        viewModel.$repositories
            .dropFirst() // Ignore initial value
            .sink { repos in
                XCTAssertTrue(repos.isEmpty)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.search()
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testSearchWithFilter() {
        let sampleRepo = Repository(
            id: 1,
            name: "SampleRepo",
            fullName: "user/SampleRepo",
            description: "Repository description",
            stargazersCount: 100,
            forksCount: 10,
            createdAt: Date(),
            updatedAt: Date(),
            owner: Owner(id: 1, login: "user", avatarUrl: "https://example.com/avatar.png", htmlUrl: "https://github.com/user")
        )
        fakeService.repositories = [sampleRepo]
        viewModel.searchQuery = "Sample"
        viewModel.filterQuery = "language:swift"
        
        let expectation = XCTestExpectation(description: "Search completes with filter")
        
        viewModel.$repositories
            .dropFirst() // Ignore initial value
            .sink { repos in
                XCTAssertEqual(repos.count, 1)
                XCTAssertEqual(repos.first?.name, "SampleRepo")
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.search()
        wait(for: [expectation], timeout: 0.1)
    }
}
