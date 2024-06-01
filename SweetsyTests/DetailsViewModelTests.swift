//
//  DetailsViewModelTests.swift
//  SweetsyTests
//
//  Created by Chetan Dhowlaghar on 6/1/24.
//

import XCTest

final class DetailsViewModelTests: XCTestCase {

    @MainActor
    func testFetchMealsRequestFailure() async {
        let mockAPIService = MockAPIService(error: NetworkError.badRequest)
        let viewModel =  DetailsViewModel(apiService: mockAPIService)
        //52767
        await viewModel.fetchDetails(mealID: 2.description)
        XCTAssertEqual(viewModel.loadingState, .failure(NetworkError.badRequest))
    }
    
    @MainActor
    func testFetchMealDetailsWithLessThan20IngredientsAndMeasurements() async {
        let mockAPIService = MockAPIService(testData: generateSampleDataWithLessThan20IngredientsAndMeasurements())
        let viewModel = DetailsViewModel(apiService: mockAPIService)
        await viewModel.fetchDetails(mealID: "2345") // dummy, because we are using mockAPI
        XCTAssertEqual(viewModel.loadingState, .success)
        if let count = viewModel.mealDetails?.ingredientMeasurements.count {
            XCTAssert( count < 20)
        }
    }
    @MainActor
    func testFetchMealDetailsWithMoreThan20IngredientsAndMeasurements() async {
        let mockAPIService = MockAPIService(testData: generateSampleDataWithMoreThan20IngredientsAndMeasurements())
        let viewModel = DetailsViewModel(apiService: mockAPIService)
        await viewModel.fetchDetails(mealID: "2345") // dummy, because we are using mockAPI
        XCTAssertEqual(viewModel.loadingState, .success)
        if let count = viewModel.mealDetails?.ingredientMeasurements.count {
            XCTAssert(count > 20)
        }
    }
}

func generateSampleDataWithLessThan20IngredientsAndMeasurements() -> Data {
    let jsonData = """
    {
        "meals": [
            {
                "idMeal": "52767",
                "strMeal": "Bakewell tart",
                "strDrinkAlternate": null,
                "strCategory": "Dessert",
                "strArea": "British",
                "strInstructions": "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\\r\\nRoll out the dough on a lightly floured work surface and use to line a 20cm\\/8in flan tin. Leave in the fridge to chill for 30 minutes.\\r\\nPreheat the oven to 200C\\/400F\\/Gas 6 (180C fan).\\r\\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\\r\\nFor the filing, spread the base of the flan generously with raspberry jam.\\r\\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\\r\\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.",
                "strMealThumb": "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/wyrqqq1468233628.jpg",
                "strTags": "Tart,Baking,Alcoholic",
                "strYoutube": "https:\\/\\/www.youtube.com\\/watch?v=1ahpSTf_Pvk",
                "strIngredient1": "plain flour",
                "strIngredient2": "chilled butter",
                "strIngredient3": "cold water",
                "strIngredient4": "raspberry jam",
                "strIngredient5": "butter",
                "strIngredient6": "caster sugar",
                "strIngredient7": "ground almonds",
                "strIngredient8": "free-range egg, beaten",
                "strIngredient9": "almond extract",
                "strIngredient10": "flaked almonds",
                "strIngredient11": "",
                "strIngredient12": "",
                "strIngredient13": "",
                "strIngredient14": "",
                "strIngredient15": "",
                "strIngredient16": null,
                "strIngredient17": null,
                "strIngredient18": null,
                "strIngredient19": null,
                "strIngredient20": null,
                "strMeasure1": "175g\\/6oz",
                "strMeasure2": "75g\\/2½oz",
                "strMeasure3": "2-3 tbsp",
                "strMeasure4": "1 tbsp",
                "strMeasure5": "125g\\/4½oz",
                "strMeasure6": "125g\\/4½oz",
                "strMeasure7": "125g\\/4½oz",
                "strMeasure8": "1",
                "strMeasure9": "½ tsp",
                "strMeasure10": "50g\\/1¾oz",
                "strMeasure11": "",
                "strMeasure12": "",
                "strMeasure13": "",
                "strMeasure14": "",
                "strMeasure15": "",
                "strMeasure16": null,
                "strMeasure17": null,
                "strMeasure18": null,
                "strMeasure19": null,
                "strMeasure20": null,
                "strSource": null,
                "strImageSource": null,
                "strCreativeCommonsConfirmed": null,
                "dateModified": null
            }
        ]
    }
    """.data(using: .utf8)!
    return jsonData
}


func generateSampleDataWithMoreThan20IngredientsAndMeasurements() -> Data {
    let jsonData = """
    {
        "meals": [
            {
                "idMeal": "52767",
                "strMeal": "Bakewell tart",
                "strDrinkAlternate": null,
                "strCategory": "Dessert",
                "strArea": "British",
                "strInstructions": "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\\r\\nRoll out the dough on a lightly floured work surface and use to line a 20cm\\/8in flan tin. Leave in the fridge to chill for 30 minutes.\\r\\nPreheat the oven to 200C\\/400F\\/Gas 6 (180C fan).\\r\\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\\r\\nFor the filing, spread the base of the flan generously with raspberry jam.\\r\\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\\r\\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.",
                "strMealThumb": "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/wyrqqq1468233628.jpg",
                "strTags": "Tart,Baking,Alcoholic",
                "strYoutube": "https:\\/\\/www.youtube.com\\/watch?v=1ahpSTf_Pvk",
                "strIngredient1": "plain flour",
                "strIngredient2": "chilled butter",
               "strIngredient3": "cold water",
               "strIngredient4": "raspberry jam",
               "strIngredient5": "butter",
               "strIngredient6": "caster sugar",
               "strIngredient7": "ground almonds",
               "strIngredient8": "free-range egg, beaten",
               "strIngredient9": "almond extract",
               "strIngredient10": "flaked almonds",
               "strIngredient11": "vanilla extract",
               "strIngredient12": "lemon zest",
               "strIngredient13": "icing sugar",
               "strIngredient14": "double cream",
               "strIngredient15": "milk",
               "strIngredient16": "dark chocolate",
               "strIngredient17": "cocoa powder",
               "strIngredient18": "baking powder",
               "strIngredient19": "bicarbonate of soda",
               "strIngredient20": "salt",
               "strIngredient21": "brown sugar",
               "strIngredient22": "honey",
               "strIngredient23": "cinnamon",
               "strIngredient24": "nutmeg",
               "strIngredient25": "mixed dried fruit",
               "strMeasure1": "175g/6oz",
               "strMeasure2": "75g/2½oz",
               "strMeasure3": "2-3 tbsp",
               "strMeasure4": "1 tbsp",
               "strMeasure5": "125g/4½oz",
               "strMeasure6": "125g/4½oz",
               "strMeasure7": "125g/4½oz",
               "strMeasure8": "1",
               "strMeasure9": "½ tsp",
               "strMeasure10": "50g/1¾oz",
               "strMeasure11": "1 tsp",
               "strMeasure12": "1 tbsp",
               "strMeasure13": "100g/3½oz",
               "strMeasure14": "200ml/7fl oz",
               "strMeasure15": "100ml/3½fl oz",
               "strMeasure16": "50g/1¾oz",
               "strMeasure17": "2 tbsp",
               "strMeasure18": "1 tsp",
               "strMeasure19": "½ tsp",
               "strMeasure20": "pinch",
               "strMeasure21": "50g/1¾oz",
               "strMeasure22": "2 tbsp",
               "strMeasure23": "1 tsp",
               "strMeasure24": "½ tsp",
               "strMeasure25": "100g/3½oz",
                "strSource": null,
                "strImageSource": null,
                "strCreativeCommonsConfirmed": null,
                "dateModified": null
            }
        ]
    }
    """.data(using: .utf8)!
    return jsonData
}
