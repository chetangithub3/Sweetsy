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
                if let imageUrl = URL(string: meal.strMealThumb) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                    } placeholder: {
                        ProgressView()
                    }
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
                if let ingredient = ingredient(for: index),
                   let measure = measure(for: index) {
                    if !ingredient.isEmpty {
                        Text("\(measure) \(ingredient)")
                    }
                }
            }
        }
    }

    private func ingredient(for index: Int) -> String? {
        switch index {
        case 0: return meal.strIngredient1
        case 1: return meal.strIngredient2
        case 2: return meal.strIngredient3
        case 3: return meal.strIngredient4
        case 4: return meal.strIngredient5
        case 5: return meal.strIngredient6
        case 6: return meal.strIngredient7
        case 7: return meal.strIngredient8
        case 8: return meal.strIngredient9
        case 9: return meal.strIngredient10
        case 10: return meal.strIngredient11
        case 11: return meal.strIngredient12
        case 12: return meal.strIngredient13
        case 13: return meal.strIngredient14
        case 14: return meal.strIngredient15
        case 15: return meal.strIngredient16
        case 16: return meal.strIngredient17
        case 17: return meal.strIngredient18
        case 18: return meal.strIngredient19
        case 19: return meal.strIngredient20
        default: return nil
        }
    }

    private func measure(for index: Int) -> String? {
        switch index {
        case 0: return meal.strMeasure1
        case 1: return meal.strMeasure2
        case 2: return meal.strMeasure3
        case 3: return meal.strMeasure4
        case 4: return meal.strMeasure5
        case 5: return meal.strMeasure6
        case 6: return meal.strMeasure7
        case 7: return meal.strMeasure8
        case 8: return meal.strMeasure9
        case 9: return meal.strMeasure10
        case 10: return meal.strMeasure11
        case 11: return meal.strMeasure12
        case 12: return meal.strMeasure13
        case 13: return meal.strMeasure14
        case 14: return meal.strMeasure15
        case 15: return meal.strMeasure16
        case 16: return meal.strMeasure17
        case 17: return meal.strMeasure18
        case 18: return meal.strMeasure19
        case 19: return meal.strMeasure20
        default: return nil
        }
    }
}
class DetailsViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
    @Published var mealDetails: MealDetail?
    var apiService: APIService
    init(apiService: APIService) {
        self.apiService = apiService
    }
    func fetchDetails(mealID: String) async {
        let urlString = Constants.API.mealLookupURL + mealID 
           guard let url = URL(string: urlString) else {
               self.loadingState = .failure(NetworkError.badRequest)
               return
           }
        let request = URLRequest(url: url)
        let result = await apiService.fetch(request: request)
        switch result {
            case .success(let data):
                await decodeMealDetails(data)
            case .failure(let error):
                self.loadingState = .failure(error)
        }
    }
    
    @MainActor
    func decodeMealDetails(_ data: Data) {
        do {
            let mealDetails = try JSONDecoder().decode(MealDetails.self, from: data)
            if let firstItem = mealDetails.meals.first {
                self.mealDetails = firstItem
                self.loadingState = .success
            } else {
                self.loadingState = .failure(NetworkError.notFound)
            }
        } catch {
            self.loadingState = .failure(NetworkError.decodingError)
        }
    }
}
