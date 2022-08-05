//
//  CoreDataRepository.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import Foundation

import Foundation
import CoreData

protocol AbstractRepository {
    associatedtype T
    func query(
        with predicate: NSPredicate?,
        completion: @escaping (Result<[T], Error>) -> Void
    )
    func save(entity: T, completion: @escaping (Result<[T], Error>) -> Void)
    func delete(entity: T, completion: @escaping (Result<[T], Error>) -> Void)
}

final class CoreDataRepository<T: NSManagedObject>: AbstractRepository {
    
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func query(with predicate: NSPredicate? = nil,
               completion: @escaping (Result<[T], Error>) -> Void) {
        do {
            let request = T.fetchRequest()
            request.predicate = predicate
            completion(.success(try (context.fetch(request) as? [T] ?? [])))
        } catch {
            completion(.failure(error))
        }
    }

    func save(entity: T, completion: @escaping (Result<[T], Error>) -> Void) {
        
    }

    func delete(entity: T, completion: @escaping (Result<[T], Error>) -> Void) {
        
    }

}
