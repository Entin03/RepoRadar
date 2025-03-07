//
//  RepositorySearchView.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 06..
//

import SwiftUI

struct RepositorySearchView: View {
    @StateObject private var viewModel = RepositorySearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $viewModel.searchQuery, filterText: $viewModel.filterQuery, onSearch: viewModel.search)
                    .padding(.horizontal)
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                if let error = viewModel.error {
                    Text(error.localizedDescription)
                        .foregroundColor(.red)
                        .padding()
                }
                
                List(viewModel.repositories) { repository in
                    NavigationLink(destination: RepositoryDetailView(repository: repository)) {
                        RepositoryRowView(repository: repository)
                    }
                    .padding(.horizontal)
                    .listRowBackground(Color.clear)
                    .background(Colors.secondary.opacity(0.6))
                    .cornerRadius(8)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
            }
            .navigationTitle("RepoRadar")
            .background(Colors.background)
        }
    }
}

#Preview {
    RepositorySearchView()
}
