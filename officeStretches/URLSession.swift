//
//  URLSession.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import Foundation

extension URLSession {
    func getData(request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {
        let (data, response) = try await data(for: request)
        
        guard let responseHTTP = response as? HTTPURLResponse else {
            throw NetworkError.nonHTTPURLResponse
        }
        
        return (data, responseHTTP)
        
    }
}
