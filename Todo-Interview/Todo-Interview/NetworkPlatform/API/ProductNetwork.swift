//
//  ProductNetwork.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

class ProductNetwork {
    private let network: Network<Product>
    
    init(network: Network<Product>) {
        self.network = network
    }
    
    func fetchBuyProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        network.getItems("buy", completion: completion)
    }
}
