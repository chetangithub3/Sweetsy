//
//  HomeView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView {
            ForEach(viewModel.meals, id: \.idMeal) { meal in
                Text(meal.strMeal ?? "")
            }
        }
            
    }
}

#Preview {
    HomeView()
}
