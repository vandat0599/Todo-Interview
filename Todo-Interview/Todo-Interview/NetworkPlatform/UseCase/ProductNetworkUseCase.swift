//
//  ProductNetworkUseCase.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import Foundation

class ProductNetworkUseCase: ProductUseCase {
    
    private let network: ProductNetwork
    
    init() {
        network = NetworkProvider().makeProductsNetwork()
    }
    
    func products(completion: @escaping (Result<[Product], Error>) -> Void) {
        return network.fetchBuyProducts(completion: completion)
    }
    
    func save(product: Product, completion: @escaping (Result<Product, Error>) -> Void) {
        
    }
    
    func delete(product: Product, completion: @escaping (Result<Product, Error>) -> Void) {
        
    }
}
