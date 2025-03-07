//
//  Repository.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 05..
//

import Foundation

struct Repository: Decodable, Identifiable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let forksCount: Int
    let createdAt: Date
    let updatedAt: Date
    let owner: Owner
}
