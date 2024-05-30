//
//  HomeView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var column = GridItem(.flexible(), spacing: 16)
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: [column, column],
                spacing: 16) {
                    ForEach(viewModel.meals, id: \.idMeal) { meal in
                        NavigationLink {
                            MealItemDetailView()
                        } label: {
                            MealItemView(meal: meal)
                        }
                    }
                }
                .padding()
        }.background(.pink.opacity(0.5).gradient)
    }
}

#Preview {
    HomeView()
}

