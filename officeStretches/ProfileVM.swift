//
//  ProfileVM.swift
//  officeStretches
//
//  Created by Alex  on 27/5/24.
//

import Foundation

final class ProfileVM: ObservableObject {
    @Published var profile = Profile() {
        didSet {
            saveProfile()
        }
    }
    
    
    let profileInteractor: profileInteractorProtocol
    
    init(profileInteractor: profileInteractorProtocol = ProfileInteractor.shared) {
        self.profileInteractor = profileInteractor
        loadProfile()
    }
    
    func loadProfile() {
        do {
            self.profile = try profileInteractor.loadProfile()
        } catch {
            print(error)
        }
    }
    
    func saveProfile() {
        do {
            try profileInteractor.saveProfile(profile: profile)
        } catch {
            print(error)
        }
    }
}
