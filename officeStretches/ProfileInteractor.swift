//
//  ProfileInteractor.swift
//  officeStretches
//
//  Created by Alex  on 25/6/24.
//

import Foundation

protocol profileInteractorProtocol {
    func loadProfile() throws -> Profile
    func saveProfile(profile: Profile) throws
}

struct ProfileInteractor: profileInteractorProtocol {
    
    static let shared = ProfileInteractor()
    
    func loadProfile() throws -> Profile {
        if FileManager.default.fileExists(atPath: URL.documentsDirectory.appending(path: "Profile.json").path()) {
            let data = try Data(contentsOf: URL.documentsDirectory.appending(path: "Profile.json"))
            return try JSONDecoder().decode(Profile.self, from: data)
        } else {
            return Profile()
        }
    }
    
    func saveProfile(profile: Profile) throws {
        let data = try JSONEncoder().encode(profile)
        try data.write(to: URL.documentsDirectory.appending(path: "Profile.json"), options: .atomic)
    }
    
    
    
}
