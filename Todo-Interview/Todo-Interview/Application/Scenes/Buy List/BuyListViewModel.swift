//
//  BuyListViewModel.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import Foundation

protocol BuyListViewModelType {
    var products: [Product] { get set }
    var productUseCase: ProductUseCase { get }
    var navigator: BuyListNavigatorType { get }
    init(productUseCase: ProductUseCase, navigator: BuyListNavigatorType)
    
    // inputs
    func reloadData()
    func didTapProduct(product: Product)
    
    // outputs for binding
    var productsDataChanged: (([Product]) -> Void)? { get set }
    var loadingTrigger: ((_ isLoading: Bool) -> Void)? { get set }
}

class BuyListViewModel: BuyListViewModelType {
    
    var loadingTrigger: ((_ isLoading: Bool) -> Void)?
    var productsDataChanged: (([Product]) -> Void)?
    var products: [Product] {
        didSet {
            productsDataChanged?(products)
        }
    }
    
    let productUseCase: ProductUseCase
    let navigator: BuyListNavigatorType
    
    required init(productUseCase: ProductUseCase, navigator: BuyListNavigatorType) {
        self.productUseCase = productUseCase
        self.navigator = navigator
        products = []
    }
    
    // MARK: - inputs
    
    func reloadData() {
        loadingTrigger?(true)
        productUseCase.products {[weak self] result in
            guard let self = self else { return }
            self.loadingTrigger?(false)
            switch result {
            case .success(let data):
                print(data)
                self.products = data
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func didTapProduct(product: Product) {
        navigator.toProductDetail(product: product)
    }
}
