//
//  ProductUseCase.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

protocol ProductUseCase {
    func products(completion: @escaping (Result<[Product], Error>) -> Void)
    func save(product: Product, completion: @escaping (Result<Product, Error>) -> Void)
    func delete(product: Product, completion: @escaping (Result<Product, Error>) -> Void)
}
