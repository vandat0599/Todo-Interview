//
//  HomeNavigator.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import UIKit

protocol HomeNavigatorType {
    func toCall()
    func toBuy()
    func toSell()
}

class HomeNavigator: HomeNavigatorType {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toCall() {
        let viewModel = CallListViewModel(
            userUseCase: UserNetworkUseCase(),
            navigator: CallListNavigator(navigationController: navigationController)
        )
        
        let viewController = CallListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toBuy() {
        let viewModel = BuyListViewModel(
            productUseCase: ProductNetworkUseCase(),
            navigator: BuyListNavigator(navigationController: navigationController)
        )
        
        let viewController = BuyListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toSell() {
        
    }
    
    
}
