//
//  UserUseCase.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

protocol UserUseCase {
    func users(completion: @escaping (Result<[User], Error>) -> Void)
}
