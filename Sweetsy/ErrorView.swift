//
//  ErrorView.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import SwiftUI

struct ErrorView: View {
    var error: Error
    var body: some View {
        Text(error.localizedDescription)
    }
}

#Preview {
    ErrorView(error: NetworkError.unknown)
}
