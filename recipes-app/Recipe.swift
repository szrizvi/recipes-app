//
//  Recipe.swift
//  recipes-app
//
//  Created by Zainab Rizvi on 14/02/2025.
//

import SwiftUI

struct Recipes: Codable {
    var recipes: [Recipe]
}

struct Recipe: Codable {
    var uuid: String
    var name: String
    var cuisine: String
    var photo_url_small: String
}
