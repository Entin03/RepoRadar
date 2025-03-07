//
//  RepositoryInfoView.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 07..
//

import SwiftUI
import Foundation

struct RepositoryInfoView: View {
    let repository: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(repository.name).font(.title)
                .foregroundStyle(Colors.primary)
                .padding()
                .background(Colors.secondary.opacity(0.4))
                .cornerRadius(8)
            Divider()
                .background(Colors.secondary)
            Text("Repo Description:")
                .underline()
                .foregroundStyle(Colors.primary)
            Text(repository.description ?? "No description").font(.body)
                .foregroundStyle(Colors.primary)
                .padding(.bottom)
            StatRowView(icon: "star.fill", value: "\(repository.stargazersCount)", color: .yellow)
            StatRowView(icon: "arrow.triangle.branch", value: "Forks: \(repository.forksCount)")
                .padding(.bottom, 8)
            StatRowView(icon: "calendar", value: "Created: \(DateFormatter.githubDateFormatter.string(from: repository.createdAt))")
                .font(.footnote)
            StatRowView(icon: "clock", value: "Updated: \(DateFormatter.githubDateFormatter.string(from: repository.updatedAt))")
                .font(.footnote)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Colors.secondary.opacity(0.25))
        .cornerRadius(8)
    }
}

#Preview {
    RepositoryInfoView(repository: Repository(id: 1, name: "Name", fullName: "Full Name", description: "Repo description", stargazersCount: 8, forksCount: 12, createdAt: Date(), updatedAt: Date(), owner: Owner(id: 1, login: "login", avatarUrl: "url", htmlUrl: "url")))
}
