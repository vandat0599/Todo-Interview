//
//  SellListNavigator.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import UIKit

protocol SellListNavigatorType {
    func toProductDetail(product: Product)
}

class SellListNavigator: SellListNavigatorType {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toProductDetail(product: Product) {
        print("toProductDetail: \(product.name)")
    }
}
