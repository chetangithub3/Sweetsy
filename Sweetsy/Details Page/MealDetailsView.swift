//
//  MealDetailsView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/30/24.
//

import SwiftUI
struct MealDetailsView: View {
    var meal: MealDetail
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                if let imageUrl = meal.thumbnailURL {
                    ImageView(imageURLString: imageUrl)
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .cornerRadius(20)
                }
                HStack(alignment: .bottom){
                    Text(meal.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    Spacer()
                    Text(meal.category)
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                .padding(.top)
                IngredientsView(meal: meal)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Steps:")
                        .font(.title3)
                        .foregroundColor(.primary)
                        .bold()
                        .padding(.top)
                    Divider()
                }
                
                if let steps = meal.steps() {
                    ForEach(steps, id: \.self) { step in
                        HStack(alignment: .top, spacing: 8){
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 5, height: 5)
                                .padding(.top, 8)
                            Text(step)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(meal.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
