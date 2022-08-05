//
//  UserNetworkUseCase.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

class UserNetworkUseCase: UserUseCase {
    
    private let network: UserNetwork
    
    init() {
        network = NetworkProvider().makeUsersNetwork()
    }
    
    func users(completion: @escaping (Result<[User], Error>) -> Void) {
        // - TODO: fetch & save cached here
        return network.fetchCallUsers(completion: completion)
    }
}
