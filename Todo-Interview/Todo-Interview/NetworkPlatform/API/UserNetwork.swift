//
//  UserNetwork.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

class UserNetwork {
    private let network: Network<User>
    
    init(network: Network<User>) {
        self.network = network
    }
    
    func fetchCallUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        network.getItems("call", completion: completion)
    }
}
