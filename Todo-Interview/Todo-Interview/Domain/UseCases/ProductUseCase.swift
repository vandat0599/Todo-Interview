//
//  ProductUseCase.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

protocol ProductUseCase {
    func products() -> [Product]
    func save(product: Product) -> Void
    func delete(product: Product) -> Void
}
