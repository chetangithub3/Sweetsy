//
//  ItemDetails.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import Foundation


    // MARK: - MealResponse
struct MealDetails: Codable {
    let meals: [MealDetail]
}

    // MARK: - Meal
struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    func ingredient(for index: Int) -> String? {
        switch index {
            case 0: return strIngredient1
            case 1: return strIngredient2
            case 2: return strIngredient3
            case 3: return strIngredient4
            case 4: return strIngredient5
            case 5: return strIngredient6
            case 6: return strIngredient7
            case 7: return strIngredient8
            case 8: return strIngredient9
            case 9: return strIngredient10
            case 10: return strIngredient11
            case 11: return strIngredient12
            case 12: return strIngredient13
            case 13: return strIngredient14
            case 14: return strIngredient15
            case 15: return strIngredient16
            case 16: return strIngredient17
            case 17: return strIngredient18
            case 18: return strIngredient19
            case 19: return strIngredient20
            default: return nil
        }
    }
    
    func measure(for index: Int) -> String? {
        switch index {
            case 0: return strMeasure1
            case 1: return strMeasure2
            case 2: return strMeasure3
            case 3: return strMeasure4
            case 4: return strMeasure5
            case 5: return strMeasure6
            case 6: return strMeasure7
            case 7: return strMeasure8
            case 8: return strMeasure9
            case 9: return strMeasure10
            case 10: return strMeasure11
            case 11: return strMeasure12
            case 12: return strMeasure13
            case 13: return strMeasure14
            case 14: return strMeasure15
            case 15: return strMeasure16
            case 16: return strMeasure17
            case 17: return strMeasure18
            case 18: return strMeasure19
            case 19: return strMeasure20
            default: return nil
        }
    }
}
