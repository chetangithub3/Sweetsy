//
//  ContentView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        VStack {
            switch viewModel.loadingState {
                case .none:
                    EmptyView()
                       
                case .loading:
                    ProgressView {
                        Text("Fetching items")
                    }
                case .success:
                    NavigationStack{
                        HomeView()
                    }
                    
                case .failure(let error):
                    ErrorView(error: error)
            }
        }.task {
            await viewModel.fetchMeals()
        }
       
        
    }
}


