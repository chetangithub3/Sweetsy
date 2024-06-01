//
//  Constants.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import Foundation
import SwiftUI

struct Constants {
    struct API {
        static let dessertCategoryURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        static let mealLookupURL = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }
}

public enum LoadingState: Equatable {
    public static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.none, .none):
            return true
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case let (.failure(error1), .failure(error2)):
                return error1.localizedDescription == error2.localizedDescription
        default:
            return false
        }
    }
    
    case none
    case loading
    case success
    case failure(Error)
}

extension View {
    func getScreenBounds() -> CGRect {
        let bounds = UIScreen.main.bounds
        let width = min(bounds.width, bounds.height)
        let height = max(bounds.width, bounds.height)
        return CGRect(x: 0, y: 0, width: width, height: height)
    }
}

protocol APIServiceProtocol {
    func fetch(request: URLRequest?) async -> Result<Data, NetworkError>
}
