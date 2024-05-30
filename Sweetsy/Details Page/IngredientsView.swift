//
//  IngredientsView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/30/24.
//

import SwiftUI

struct IngredientsView: View {
    let meal: MealDetail
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            ForEach(0..<20) { index in
                if let ingredient =  meal.ingredient(for: index),
                   let measure = meal.measure(for: index) {
                    if !ingredient.isEmpty {
                        HStack {
                            Text(ingredient.capitalized)
                                .frame(width: getScreenBounds().width / 2 - 20, alignment: .leading)
                                .foregroundColor(.primary)
                            Text(measure)
                                .frame(alignment: .leading)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                    }
                }
            } 
            .listStyle(InsetGroupedListStyle())
                .cornerRadius(20)
                .shadow(radius: 5)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
