//
//  HomeViewModel.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

protocol HomeViewModelType {
    var navigator: HomeNavigatorType { get }
    init(navigator: HomeNavigatorType)
}

class HomeViewModel: HomeViewModelType {
    let navigator: HomeNavigatorType
    
    required init(navigator: HomeNavigatorType) {
        self.navigator = navigator
    }
}
