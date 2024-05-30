//
//  ContentView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView {
            
        }.task {
            await viewModel.fetchMeals()
        }
    }
}

#Preview {
    HomeView()
}
