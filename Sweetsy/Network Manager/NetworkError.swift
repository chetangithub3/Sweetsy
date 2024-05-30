//
//  NetworkError.swift
//  Sweetsy
//
//  Created by Chetan Dhowlaghar on 5/30/24.
//

import Foundation
public enum NetworkError: Error, LocalizedError {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case decodingError
    case unknown
}
