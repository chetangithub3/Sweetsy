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

struct MealDetailsView: View {
    var meal: MealDetail
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                if let imageUrl = meal.strMealThumb {
                    ImageView(imageURLString: imageUrl)
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .cornerRadius(20)
                }
                Text(meal.strMeal)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                Text(meal.strCategory)
                    .font(.title2)
                    .foregroundColor(.secondary)
                Text(meal.strInstructions)
                    .padding(.top)
                IngredientsView(meal: meal)
            }
            .padding()
        }
        
    }
}

struct IngredientsView: View {
    let meal: MealDetail

    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.headline)
                .padding(.top)

            ForEach(0..<20) { index in
                if let ingredient =  meal.ingredient(for: index),
                   let measure = meal.measure(for: index) {
                    if !ingredient.isEmpty {
                        Text("\(measure) \(ingredient.capitalized)")
                    }
                }
            }
        }
    }
}
