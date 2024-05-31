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

struct MealDetail: Codable {
    let id: String
    let name: String
    let alternateDrink: String?
    let category: String
    let area: String
    let instructions: String
    let thumbnailURL: String?
    let tags: String?
    let youtubeURL: String?
    let ingredientMeasurements: [String: String]
    let sourceURL: String?
    let imageSourceURL: String?
    let isCreativeCommonsConfirmed: String?
    let dateModified: String?
}

extension MealDetail {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case alternateDrink = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnailURL = "strMealThumb"
        case tags = "strTags"
        case youtubeURL = "strYoutube"
        case sourceURL = "strSource"
        case imageSourceURL = "strImageSource"
        case isCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        alternateDrink = try container.decodeIfPresent(String.self, forKey: .alternateDrink)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        thumbnailURL = try container.decodeIfPresent(String.self, forKey: .thumbnailURL)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        youtubeURL = try container.decodeIfPresent(String.self, forKey: .youtubeURL)
        sourceURL = try container.decodeIfPresent(String.self, forKey: .sourceURL)
        imageSourceURL = try container.decodeIfPresent(String.self, forKey: .imageSourceURL)
        isCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .isCreativeCommonsConfirmed)
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        
        var ingredientMeasurements: [String: String] = [:]
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        for key in dynamicContainer.allKeys {
            if key.stringValue.starts(with: "strIngredient"),
               let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: key),
               !ingredient.isEmpty {
                let index = key.stringValue.replacingOccurrences(of: "strIngredient", with: "")
                let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(index)")!
                let measurement = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey) ?? ""
                ingredientMeasurements[ingredient] = measurement
            }
        }
        self.ingredientMeasurements = ingredientMeasurements
    }
}

extension MealDetail {
    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = "\(intValue)"
        }
    }
}

extension MealDetail {
    func steps() -> [String]? {
        return instructions.components(separatedBy: ". ")
    }
}
