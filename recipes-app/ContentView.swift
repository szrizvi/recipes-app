//
//  ContentView.swift
//  recipes-app
//
//  Created by Zainab Rizvi on 13/02/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RecipesViewModel()
    
    var body: some View {
        VStack {
            Text("Recipes")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
            
                NavigationView {
                    if viewModel.recipes.isEmpty {
                        EmptyView()
                            .onAppear() {
                                Task {
                                    await viewModel.fetchData()
                                }
                            }
                            .refreshable {
                                await viewModel.fetchData()
                            }
                    } else {
                        List {
                            ForEach(viewModel.recipes, id: \.uuid) { recipe in
                                recipeItem(recipe: recipe)
                            }
                        }.task {
                            await viewModel.fetchData()
                            print(viewModel.recipes)
                        }
                        .refreshable {
                            await viewModel.fetchData()
                        }
                }
            }
        }
    }
}

struct recipeItem: View {
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            ImageCacher(url: URL(string: recipe.photo_url_small)!) {
                phase in
                switch phase {
                case .success(let image):
                    HStack {
                        image
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    }
                case .failure(_), .empty:
                    // display empty view with error
                    ImageLoadingView()
                @unknown default:
                    ImageLoadingView()
                }
            }
            VStack(alignment: .leading, spacing: 12) {
                Text(self.recipe.name)
                    .bold()
                Text(self.recipe.cuisine)
                    .italic()
            }
        }
    }
}

#Preview {
    ContentView()
}
