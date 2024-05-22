//
//  URLRequest.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import Foundation

extension URLRequest {
    static func get(url: URL, muscle: Muscles) async throws -> URLRequest {
        var request = URLRequest(url: url)
        let headers = [
            "X-RapidAPI-Key": "6313d80101mshcf7534d37d3d405p171bf2jsn2509c89a5d1d",
            "X-RapidAPI-Host": "work-out-api1.p.rapidapi.com"
        ]
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.url?.append(queryItems: [URLQueryItem(name: "Muscles", value: muscle.rawValue)])
        return request
    }
}
