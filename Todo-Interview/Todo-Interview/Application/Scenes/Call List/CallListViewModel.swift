//
//  CallListViewModel.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import Foundation

protocol CallListViewModelType {
    var users: [User] { get set }
    var userUseCase: UserUseCase { get }
    var navigator: CallListNavigatorType { get }
    init(userUseCase: UserUseCase, navigator: CallListNavigatorType)
    
    // inputs
    func reloadData()
    func didTapUser(user: User)
    
    // outputs for binding
    var userDataChanged: (([User]) -> Void)? { get set }
    var loadingTrigger: ((_ isLoading: Bool) -> Void)? { get set }
}

class CallListViewModel: CallListViewModelType {
    
    var loadingTrigger: ((_ isLoading: Bool) -> Void)?
    var userDataChanged: (([User]) -> Void)?
    var users: [User] {
        didSet {
            userDataChanged?(users)
        }
    }
    
    let userUseCase: UserUseCase
    let navigator: CallListNavigatorType
    
    required init(userUseCase: UserUseCase, navigator: CallListNavigatorType) {
        self.userUseCase = userUseCase
        self.navigator = navigator
        users = []
    }
    
    // MARK: - inputs
    
    func reloadData() {
        loadingTrigger?(true)
        userUseCase.users {[weak self] result in
            guard let self = self else { return }
            self.loadingTrigger?(false)
            switch result {
            case .success(let data):
                print(data)
                self.users = data
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func didTapUser(user: User) {
        navigator.toUserProfile(user: user)
    }
}
