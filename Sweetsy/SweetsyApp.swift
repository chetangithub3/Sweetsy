//
//  SweetsyApp.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

@main
struct SweetsyApp: App {
    @StateObject var viewModel = HomeViewModel(apiService: APIService())
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
