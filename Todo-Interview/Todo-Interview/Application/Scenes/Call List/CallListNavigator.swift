//
//  CallListNavigator.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import UIKit

protocol CallListNavigatorType {
    func toUserProfile(user: User)
}

class CallListNavigator: CallListNavigatorType {
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toUserProfile(user: User) {
        print("To user profile screen: \(user.name)")
    }
}
