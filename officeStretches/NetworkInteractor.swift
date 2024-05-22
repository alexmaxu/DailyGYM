//
//  NetworkInteractor.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import Foundation

protocol NetworkInteractor {
    var session: URLSession { get }
}

extension NetworkInteractor {
    func getJSONFromURL<T>(request:URLRequest, type: T.Type) async throws -> T where T:Codable {
        let (data, responseHTTP) = try await session.getData(request: request)
        
        guard responseHTTP.statusCode == 200 else {
            throw NetworkError.badStatusCode(responseHTTP.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.JSONDecoderError(error)
        }
    }
}
