//
//  ProfileVM.swift
//  officeStretches
//
//  Created by Alex  on 27/5/24.
//

import Foundation

final class ProfileVM: ObservableObject {
    @Published var profile = Profile()
    
    let profileInteractor: profileInteractorProtocol
    
    init(profileInteractor: profileInteractorProtocol = ProfileInteractor.shared) {
        self.profileInteractor = profileInteractor
    }
    // falta hacer el save y load de profile y lvl
}
