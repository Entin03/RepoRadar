//
//  SearchBarView.swift
//  RepoRadar
//
//  Created by Valentin Taradaj on 2025. 03. 07..
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var filterText: String
    var onSearch: () -> Void

    var body: some View {
        VStack {
            Text("Repository Search")
                .foregroundStyle(Colors.primary)
            TextField("Search for repositories", text: $searchText)
                .padding()
                .background(Color(hex: "4F959D").opacity(0.5))
                .foregroundStyle(Colors.primary)
                .cornerRadius(10)
            Text("Flters")
                .foregroundStyle(Colors.primary)
            TextField("Optional filters (e.g., language:swift stars:>100)", text: $filterText)
                .padding()
                .background(Color(hex: "4F959D").opacity(0.5))
                .foregroundStyle(Colors.primary)
                .cornerRadius(10)
                .padding(.bottom)
            Button(action: onSearch) {
                Text("Search")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(
                        gradient: Gradient(colors: [Colors.buttonGradientStart.opacity(0.4), Colors.buttonGradientEnd.opacity(0.4)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .foregroundColor(.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .padding()
        .background(Colors.secondary.opacity(0.8))
        .cornerRadius(12)
        .shadow(radius: 10)
    }
}

#Preview {
    SearchBarView(searchText: .constant(""), filterText: .constant(""), onSearch: {})
}
