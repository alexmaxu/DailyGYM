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
//        CUENTA DE ALEXMAXU
//        let headers = [
//            "X-RapidAPI-Key": "6313d80101mshcf7534d37d3d405p171bf2jsn2509c89a5d1d",
//            "X-RapidAPI-Host": "work-out-api1.p.rapidapi.com"
//        ]
        
//        CUENTA DE ALEXHHANWAYY
        let headers = [
            "x-rapidapi-key": "95f8c2d9a5msh6d6d7f8611525b5p10c0acjsndafb5bd3ba67",
            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        ]
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.url?.append(queryItems: [URLQueryItem(name: "Muscles", value: muscle.rawValue)])
        return request
    }
    
    static func getAllExercisesURL(url:URL) async throws -> URLRequest {
        var request = URLRequest(url: url)
        //        CUENTA DE ALEXMAXU
        //        let headers = [
        //            "X-RapidAPI-Key": "6313d80101mshcf7534d37d3d405p171bf2jsn2509c89a5d1d",
        //            "X-RapidAPI-Host": "work-out-api1.p.rapidapi.com"
        //        ]
        
        //        CUENTA DE ALEXHHANWAYY
        let headers = [
            "x-rapidapi-key": "95f8c2d9a5msh6d6d7f8611525b5p10c0acjsndafb5bd3ba67",
            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        ]
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
}
