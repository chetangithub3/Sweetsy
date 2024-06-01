//
//  MockAPIService.swift
//  SweetsyTests
//
//  Created by Chetan Dhowlaghar on 6/1/24.
//

import Foundation
struct MockAPIService: APIServiceProtocol {
    var testData: Data?
    var error: NetworkError?
    init(testData: Data? = nil, error: NetworkError? = nil) {
        self.testData = testData
        self.error = error
    }
    func fetch(request: URLRequest?) async -> Result<Data, NetworkError> {
        if let error = error {
            return .failure(error)
        } else if let testData = testData {
            return .success(testData)
        } else {
            return .failure(NetworkError.decodingError)
        }
    }
}
