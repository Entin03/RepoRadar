//
//  RepositoryDetailView.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 06..
//

import SwiftUI

struct RepositoryDetailView: View {
    let repository: Repository
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ProfileView(owner: repository.owner)
                    .padding(.top, 16)
                RepositoryInfoView(repository: repository)
                
                if let repoURL = URL(string: "https://github.com/\(repository.fullName)") {
                    Link("GitHub Repository", destination: repoURL)
                        .padding(.top, 20)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationTitle("Details")
        .background(Colors.background)
    }
}

#Preview {
    RepositoryDetailView(repository: Repository(id: 1, name: "Name", fullName: "Full Name", description: "Repo description", stargazersCount: 8, forksCount: 12, createdAt: Date(), updatedAt: Date(), owner: Owner(id: 1, login: "login", avatarUrl: "url", htmlUrl: "url")))
}
