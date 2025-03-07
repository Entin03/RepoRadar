//
//  RepositoryRowView.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 07..
//

import SwiftUI

struct RepositoryRowView: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.headline)
                .foregroundStyle(Colors.primary)
            Divider()
                .background(Colors.secondary)
                .padding(.bottom)
            Text(repository.description ?? "No description")
                .font(.subheadline)
                .lineLimit(2)
                .foregroundStyle(Colors.primary)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(repository.stargazersCount)")
                    .foregroundStyle(Colors.primary)
            }
            .padding(.bottom, 4)

            Text("Last updated: \(repository.updatedAt, formatter: DateFormatter.githubDateFormatter)")
                .font(.caption)
                .foregroundStyle(Colors.primary.opacity(0.6))
        }
        .padding()
    }
}
