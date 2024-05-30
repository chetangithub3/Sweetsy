//
//  Constants.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import Foundation
struct Constants {
    struct API {
        static let dessertCategoryURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let mealLookupURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }
}


public enum LoadingState {
    case none
    case loading
    case success
    case failure(Error)
}
