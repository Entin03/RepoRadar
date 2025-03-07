//
//  DateFormatter+Extension.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 07..
//

import Foundation

extension DateFormatter {
    static let githubDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}

