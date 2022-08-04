//
//  CallListViewController.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import UIKit

class CallListViewController: UIViewController {
    
    private lazy var callListTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func loadView() {
        super.loadView()
        layoutViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func layoutViews() {
        title = "Call List"
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            callListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            callListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            callListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            callListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
