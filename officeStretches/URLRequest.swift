//
//  URLRequest.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import Foundation

extension URLRequest {
    static func get(url: URL, muscle: Muscles) async throws -> URLRequest {
        let appConfig = AppConfig.shared
        var request = URLRequest(url: url)
        let headers = [
            "x-rapidapi-key": appConfig.APIKey ?? "No ApiKey",
            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        ]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.url?.append(queryItems: [URLQueryItem(name: "Muscles", value: muscle.rawValue)])
        return request
    }
    
    static func getAllExercisesURL(url:URL) async throws -> URLRequest {
        let appConfig = AppConfig.shared
        var request = URLRequest(url: url)
        let headers = [
            "x-rapidapi-key": appConfig.APIKey ?? "No ApiKey",
            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        ]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
}
