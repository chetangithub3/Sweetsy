//
//  UltrathinBackground.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/30/24.
//

import SwiftUI
struct UltrathinBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color(red: 1, green: 0.58, blue: 0.6), Color(red: 0.6, green: 0.8, blue: 1), Color(red: 0.8, green: 0.6, blue: 1)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .opacity(0.5)
    }
}
