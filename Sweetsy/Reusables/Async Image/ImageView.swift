//
//  ImageView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI
struct ImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let imageURLString: String
    var body: some View {
        VStack(alignment: .center) {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
            }
        }.task {
           await loadImage()
        }
    }
    
    func loadImage() async {
        guard let imageURL = URL(string: imageURLString) else {
            return
        }
        Task {
            await imageLoader.loadImage(from: imageURL)
        }
    }
}



