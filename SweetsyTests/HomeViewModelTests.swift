//
//  HomeViewModelTests.swift
//  SweetsyTests
//
//  Created by Chetan Dhowlaghar on 6/1/24.
//

import XCTest
@testable import Sweetsy


class HomeViewModelTests: XCTestCase {
    @MainActor
    func testFetchMealsRequestFailure() async {
        let mockAPIService = MockAPIService(error: NetworkError.badRequest)
        let viewModel: HomeViewModel = HomeViewModel(apiService: mockAPIService)
        
        await viewModel.fetchMeals()
        XCTAssertEqual(viewModel.loadingState, .failure(NetworkError.badRequest))
        XCTAssertEqual(viewModel.meals.count, 0)
        
    }
    @MainActor
    func testFetchMealsRequestSuccess() async {
        let sampleData = """
                {
                    "meals": [
                        { "idMeal": "1", "strMeal": "Meal1", "strMealThumb": "thumb1" },
                        { "idMeal": "2", "strMeal": "Meal2", "strMealThumb": "thumb2" }
                    ]
                }
                """.data(using: .utf8)!
        let mockAPIService = MockAPIService(testData: sampleData)
        let viewModel: HomeViewModel = HomeViewModel(apiService: mockAPIService)
        await viewModel.fetchMeals()
        XCTAssertEqual(viewModel.loadingState, .success)
        XCTAssertEqual(viewModel.meals.count, 2)
    }
}
