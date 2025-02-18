//
//  RecipesViewModel.swift
//  recipes-app
//
//  Created by Zainab Rizvi on 13/02/2025.
//

import Foundation


class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String? = nil
    
    @MainActor
    func fetchData(url: URL? = nil) async {
        guard let url = url ?? URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            print("url invalid")
            return
        }
        print(url)
        do {
            let (data, _) = try await (URLSession.shared.data(from: url))
            print(data)
            do {
                let decoded = try JSONDecoder().decode(Recipes.self, from: data)
                recipes = decoded.recipes
                self.errorMessage = nil  // no error message on success
            }
            catch {
                self.errorMessage = "Recipes cannot be displayed at the moment."
                print("error decoding: \(error)")
            }
        } catch {
            self.errorMessage = "Recipes cannot be displayed at the moment."
            print("error fetching data: \(error)")
        }
    }
}
