//
//  NetworkProvider.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

class NetworkProvider {
    private let apiEndpoint: String

    public init() {
        apiEndpoint = "https://my-json-server.typicode.com/imkhan334/demo-1"
    }

    public func makeProductsNetwork() -> ProductNetwork {
        let network = Network<Product>(apiEndpoint)
        return ProductNetwork(network: network)
    }
    
    public func makeUsersNetwork() -> UserNetwork {
        let network = Network<User>(apiEndpoint)
        return UserNetwork(network: network)
    }
}
