//
//  SellListViewModel.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import Foundation

protocol SellListViewModelType {
    var products: [Product] { get set }
    var productUseCase: ProductUseCase { get }
    var navigator: SellListNavigatorType { get }
    init(productUseCase: ProductUseCase, navigator: SellListNavigatorType)
    
    // inputs
    func reloadData()
    func didTapProduct(product: Product)
    func addProductTrigger()
    
    // outputs for binding
    var productsDataChanged: (([Product]) -> Void)? { get set }
    var loadingTrigger: ((_ isLoading: Bool) -> Void)? { get set }
}

class SellListViewModel: SellListViewModelType {
    
    var loadingTrigger: ((_ isLoading: Bool) -> Void)?
    var productsDataChanged: (([Product]) -> Void)?
    var products: [Product] {
        didSet {
            productsDataChanged?(products)
        }
    }
    
    let productUseCase: ProductUseCase
    let navigator: SellListNavigatorType
    
    required init(productUseCase: ProductUseCase, navigator: SellListNavigatorType) {
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
    
    func addProductTrigger() {
        let randomNumber = Int.random(in: 0..<100)
        let product = Product(id: randomNumber,
                              name: "product \(randomNumber)",
                              price: randomNumber*1000,
                              quantity: 1,
                              type: 1)
        productUseCase.save(product: product) {[weak self] _ in
            guard let self = self else { return }
            self.products.append(product)
        }
    }
}
