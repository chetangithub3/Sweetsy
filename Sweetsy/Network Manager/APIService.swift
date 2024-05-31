//
//  APIService.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/29/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetch(request: URLRequest?) async -> Result<Data, Error>
}

struct APIService: APIServiceProtocol {
    func fetch(request: URLRequest?) async -> Result<Data, Error> {
        guard let request = request else {
            return .failure(NetworkError.badRequest)
        }
        do {
            let (data,_) = try await URLSession.shared.data(for: request)
            return .success(data)
        } catch {
            return .failure(NetworkError.unknown)
        }
    }
}
