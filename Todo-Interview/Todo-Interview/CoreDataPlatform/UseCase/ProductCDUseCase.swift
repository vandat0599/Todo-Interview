//
//  ProductCDUseCase.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import Foundation
import CoreData

class ProductCDUseCase: ProductUseCase {
    
    func products(completion: @escaping (Result<[Product], Error>) -> Void) {
        do {
            let fetchRequest = NSFetchRequest<CProduct>(entityName: "CProduct")
            let results = try CoreDataStack.shared.context.fetch(fetchRequest)
            completion(.success(results.map { $0.asDomain() }))
        } catch {
            completion(.failure(error))
        }
    }
    
    func save(product: Product, completion: @escaping (Result<Product, Error>) -> Void) {
        let cProduct = CProduct(context: CoreDataStack.shared.context)
        cProduct.id = Int16(product.id)
        cProduct.name = product.name
        cProduct.price = Double(product.price)
        cProduct.quantity = Int16(product.quantity)
        completion(.success(cProduct.asDomain()))
    }
    
    func delete(product: Product, completion: @escaping (Result<Product, Error>) -> Void) {
        
    }
}
