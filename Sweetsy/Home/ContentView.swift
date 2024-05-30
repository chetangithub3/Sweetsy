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
                        NavigationStack {
                            ZStack{
                                UltrathinBackground() .edgesIgnoringSafeArea(.all)
                            HomeView()
                        }
                    }
                   
                case .failure(let error):
                    ErrorView(error: error)
            }
        }
        .task {
            await viewModel.fetchMeals()
        }
       
        
    }
}


struct UltrathinBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color(red: 1, green: 0.58, blue: 0.6), Color(red: 0.6, green: 0.8, blue: 1), Color(red: 0.8, green: 0.6, blue: 1)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(0.5) // Adjust opacity to achieve ultrathin effect
    }
}
