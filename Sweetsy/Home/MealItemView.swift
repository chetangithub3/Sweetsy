//
//  MealItemView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct MealItemView: View {
    var meal: Meal
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                if let thumbnailURL = meal.strMealThumb {
                    ImageView(imageURLString: thumbnailURL)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getScreenBounds().width / 2.3, height: getScreenBounds().width / 2)
                        .clipped()
                }
                HStack {
                    Text(meal.strMeal ?? "")
                        .font(.subheadline)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(2, reservesSpace: true)
                        .minimumScaleFactor(0.4)
                        .foregroundStyle(.pink.opacity(0.8).gradient)
                        .padding(8)
                    Spacer()
                }.background(.white.gradient)
            }
        }.frame(width: getScreenBounds().width / 2.3, height: getScreenBounds().width / 2, alignment: .leading)
            .clipped()
            .cornerRadius(8)
            .shadow(radius: 2)
    }
}
