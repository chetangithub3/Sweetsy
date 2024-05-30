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
                HStack(alignment: .bottom){
                    Text(meal.strMeal)
                        .font(.largeTitle)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .bold()
                    Spacer()
                    Text(meal.strCategory)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding(.top)
                IngredientsView(meal: meal)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Steps:")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .bold()
                        .padding(.top)
                    Divider()
                }
                if let steps = meal.steps() {
                    ForEach(steps, id: \.self) { step in
                        HStack(alignment: .top, spacing: 8){
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 5, height: 5)
                                .padding(.top, 8)
                            Text(step)
                        } 
                    }
                }
            }
            .padding()
        }
        .navigationTitle(meal.strMeal)
        .navigationBarTitleDisplayMode(.inline)
    }
}


