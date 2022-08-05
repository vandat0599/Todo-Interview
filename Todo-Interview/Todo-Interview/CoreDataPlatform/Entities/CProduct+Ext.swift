//
//  CProduct+DomainConvertible.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import Foundation

extension CProduct: DomainConvertibleType {
    
    func asDomain() -> Product {
        return Product(
            id: Int(id),
            name: name ?? "",
            price: Int(price),
            quantity: Int(quantity),
            type: Int(type)
        )
    }
}
