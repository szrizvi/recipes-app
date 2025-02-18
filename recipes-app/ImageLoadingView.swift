//
//  ImageLoadingView.swift
//  recipes-app
//
//  Created by Zainab Rizvi on 17/02/2025.
//

import SwiftUI

struct ImageLoadingView: View {
    var body: some View {
        HStack {
            Image(systemName: "questionmark")
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fill)
            .clipped()
        }
    }
}

#Preview {
    ImageLoadingView()
}
