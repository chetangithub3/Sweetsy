//
//  MealItemDetailView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct MealItemDetailView: View {
    @ObservedObject var viewModel = DetailsViewModel(apiService: APIService())
    let mealID: String
    var body: some View {
        VStack {
            switch viewModel.loadingState {
                case .none:
                    EmptyView()
                case .loading:
                    ProgressView {
                        Text("Loading Recipe")
                    }
                case .success:
                    if let meal = viewModel.mealDetails {
                        MealDetailsView(meal: meal)
                    }
                case .failure(let error):
                    ErrorView(error: error)
            }
        }.task {
            await viewModel.fetchDetails(mealID: mealID)
        }
    }
}


