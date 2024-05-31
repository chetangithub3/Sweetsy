//
//  DetailsViewModel.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/30/24.
//

import Foundation
class DetailsViewModel: ObservableObject {
    @Published var loadingState: LoadingState = .none
    @Published var mealDetails: MealDetail?
    var apiService: APIServiceProtocol
    init(apiService: APIServiceProtocol) {
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
