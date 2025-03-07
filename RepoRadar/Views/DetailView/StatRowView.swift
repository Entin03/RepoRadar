//
//  StatRowView.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 07..
//

import SwiftUI

struct StatRowView: View {
    let icon: String
    let value: String
    var color: Color = .primary
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(value)
                .foregroundStyle(Colors.primary)
        }
    }
}
