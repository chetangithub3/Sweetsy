//
//  HomeViewModel.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
    @Published var meals: [Meal] = []
    var apiService: APIService
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetchMeals() async {
        guard let url = URL(string: Constants.API.dessertCategoryURL) else {
            self.loadingState = .failure(NetworkError.badRequest)
            return
        }
        self.loadingState = .loading
        let request = URLRequest(url: url)
        let result = await apiService.fetch(request: request)
        switch result {
            case .success(let data):
               decodeMealsData(data)
            case .failure(let error):
                self.loadingState = .failure(error)
        }
    }
    
    func decodeMealsData(_ data: Data) {
        do {
            let meals = try JSONDecoder().decode(Meals.self, from: data)
            self.meals = meals.meals?.sorted() ?? []
            self.loadingState = .success
        } catch {
            self.loadingState = .failure(NetworkError.decodingError)
        }
    }
}
