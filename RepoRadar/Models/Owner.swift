//
//  Owner.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 05..
//

import Foundation

struct Owner: Decodable, Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
    let htmlUrl: String
}
