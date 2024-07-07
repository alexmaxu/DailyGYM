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
        //        I know all the API key management should be in a .plist file and handled with a different struct.
        //        But I wanted to finish the visual content first to show it to the recruiter. It's on my to-do list though.
        
        //        CUENTA DE ALEXMAXU
        //                let headers = [
        //                    "X-RapidAPI-Key": "6313d80101mshcf7534d37d3d405p171bf2jsn2509c89a5d1d",
        //                    "X-RapidAPI-Host": "work-out-api1.p.rapidapi.com"
        //                ]
        
        //        CUENTA DE ALEXHHANWAYY
        //        let headers = [
        //            "x-rapidapi-key": "95f8c2d9a5msh6d6d7f8611525b5p10c0acjsndafb5bd3ba67",
        //            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        //        ]
        
        //        CUENTA ZHENG MIN
        //        let headers = [
        //            "x-rapidapi-key": "e186cc835bmsha34927f3f8a2bcap1cc6f2jsn1a6b16c227d5",
        //            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        //        ]
        
        //        CUENTA yas
        //        let headers = [
        //            "x-rapidapi-key": "21a2f574c4msh3aeb48e3fbc40e4p15b96ajsn5dff1d0c59a3",
        //            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        //        ]
        //        CUENTA Ekko
                let headers = [
                    "x-rapidapi-key": "a7d48c1f98msh9240af27dbe6e18p19a0a2jsn763d20e1b105",
                    "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
                ]
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.url?.append(queryItems: [URLQueryItem(name: "Muscles", value: muscle.rawValue)])
        return request
    }
    
    static func getAllExercisesURL(url:URL) async throws -> URLRequest {
        var request = URLRequest(url: url)
        //        I know all the API key management should be in a .plist file and handled with a different struct.
        //        But I wanted to finish the visual content first to show it to the recruiter. It's on my to-do list though.
        
        //      CUENTA DE ALEXMAXU
//              let headers = [
//                  "X-RapidAPI-Key": "6313d80101mshcf7534d37d3d405p171bf2jsn2509c89a5d1d",
//                  "X-RapidAPI-Host": "work-out-api1.p.rapidapi.com"
//              ]
        
        //      CUENTA DE ALEXHHANWAYY
        //      let headers = [
        //          "x-rapidapi-key": "95f8c2d9a5msh6d6d7f8611525b5p10c0acjsndafb5bd3ba67",
        //          "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        //      ]
        
        //        CUENTA ZHENG MIN
        //        let headers = [
        //            "x-rapidapi-key": "e186cc835bmsha34927f3f8a2bcap1cc6f2jsn1a6b16c227d5",
        //            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        //        ]
        //        CUENTA yas
        //        let headers = [
        //            "x-rapidapi-key": "21a2f574c4msh3aeb48e3fbc40e4p15b96ajsn5dff1d0c59a3",
        //            "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
        //        ]
        //        CUENTA Ekko
                let headers = [
                    "x-rapidapi-key": "a7d48c1f98msh9240af27dbe6e18p19a0a2jsn763d20e1b105",
                    "x-rapidapi-host": "work-out-api1.p.rapidapi.com"
                ]
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return request
    }
}
