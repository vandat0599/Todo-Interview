//
//  Network.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation
import Alamofire

class Network<T: Decodable> {

    private let endPoint: String

    init(_ endPoint: String) {
        self.endPoint = endPoint
    }

    func getItems(_ path: String, completion: @escaping (Result<[T], Error>) -> Void) {
        let absolutePath = "\(endPoint)/\(path)"
        AF.request(absolutePath,
            method: .get)
            .responseDecodable(of: [T].self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
