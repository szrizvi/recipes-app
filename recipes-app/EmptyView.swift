//
//  EmptyView.swift
//  recipes-app
//
//  Created by Zainab Rizvi on 17/02/2025.
//

import SwiftUI

struct EmptyView: View {
    @ObservedObject var viewModel = RecipesViewModel()
    var body: some View {
        VStack {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .padding()
            } else if viewModel.recipes.isEmpty {
                Text("No recipes are available at the moment.")
                    .padding()
            }
            
            Button("Refresh") {
                Task {
                    await viewModel.fetchData()
                }
            }
        }
    }
}

#Preview {
    EmptyView()
}
