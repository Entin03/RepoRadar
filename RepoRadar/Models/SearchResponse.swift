//
//  SearchResponse.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 05..
//

import Foundation

struct SearchResponse: Decodable {
    let totalCount: Int
    let items: [Repository]
}
