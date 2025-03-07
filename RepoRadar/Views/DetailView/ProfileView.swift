//
//  ProfileView.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 07..
//
import SwiftUI

struct ProfileView: View {
    let owner: Owner

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: owner.avatarUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 48, height: 48)
            .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(owner.login)
                    .font(.headline)
                    .foregroundStyle(Colors.primary)
                if let url = URL(string: owner.htmlUrl) {
                    Link("GitHub Profile", destination: url)
                        .font(.subheadline)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Colors.secondary.opacity(0.8))
        .cornerRadius(8)
        .shadow(radius: 10)
    }
}

#Preview {
    ProfileView(owner: Owner(id: 1, login: "login", avatarUrl: "url", htmlUrl: "url"))
}
