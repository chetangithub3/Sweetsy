//
//  HomeView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var column = GridItem(.flexible(), spacing: 16)
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: [column, column],
                spacing: 16) {
                    ForEach(viewModel.meals, id: \.idMeal) { meal in
                        if let mealID = meal.idMeal {
                            NavigationLink {
                                ZStack{
                                    UltrathinBackground().ignoresSafeArea()
                                    MealItemDetailView(mealID: mealID)
                                        .background(.clear)
                                }
                                
                            } label: {
                                MealItemView(meal: meal)
                            }
                        }
                    }
                }
                .padding()
        }.navigationTitle("Sweetsy").foregroundColor(.white)
    }
}

#Preview {
    HomeView()
}

