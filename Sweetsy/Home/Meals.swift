//
//  Meals.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import Foundation
struct Meals: Codable {
    let meals: [Meal]?
}
struct Meal: Codable, Comparable, Identifiable {
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        (lhs.strMeal ?? "") < (rhs.strMeal ?? "")
    }
    var id: String {
        idMeal ?? UUID().uuidString
    }
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
}
