//
//  DomainConvertibleType.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import Foundation

protocol DomainConvertibleType {
    associatedtype DomainType
    
    func asDomain() -> DomainType
}
