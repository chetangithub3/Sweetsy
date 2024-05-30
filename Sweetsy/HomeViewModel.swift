//
//  HomeViewModel.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var errorMessage: String?
    
    var apiService: APIService
    init(apiService: APIService) {
        self.apiService = apiService
    }
    func fetchMeals() async {
        guard let url = URL(string: Constants.API.dessertCategoryURL) else {
            self.errorMessage = "Unknown error occured"
            return
        }
        let request = URLRequest(url: url)
        let result = await apiService.fetch(request: request)
        switch result {
            case .success(let data):
                do {
                    let meals = try JSONDecoder().decode(Meals.self, from: data)
                    dump(meals)
                } catch {
                    self.errorMessage = "Decoding error"
                }
                
            case .failure(let error):
                self.errorMessage = error.localizedDescription
        }
    }
}
