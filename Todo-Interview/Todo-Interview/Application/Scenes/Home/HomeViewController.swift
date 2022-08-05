//
//  HomeViewController.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var callListButton: UIButton = {
        let view = UIButton()
        view.setTitle("Call List", for: .normal)
        view.backgroundColor = .lightGray
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(toCallTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buyListButton: UIButton = {
        let view = UIButton()
        view.setTitle("Buy List", for: .normal)
        view.backgroundColor = .lightGray
        view.setTitleColor(.black, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sellListButton: UIButton = {
        let view = UIButton()
        view.setTitle("Buy List", for: .normal)
        view.backgroundColor = .lightGray
        view.setTitleColor(.black, for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let viewModel: HomeViewModelType
    
    // MARK: - init
    
    init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lift cycle
    
    override func loadView() {
        super.loadView()
        layoutViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func layoutViews() {
        title = "Home"
        view.backgroundColor = .white
        view.addSubview(callListButton)
        view.addSubview(buyListButton)
        view.addSubview(sellListButton)
        
        NSLayoutConstraint.activate([
            callListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            callListButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buyListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyListButton.topAnchor.constraint(equalTo: callListButton.bottomAnchor, constant: 30),
            
            sellListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sellListButton.topAnchor.constraint(equalTo: buyListButton.bottomAnchor, constant: 30),
        ])
    }
    
    @objc private func toCallTapped() {
        viewModel.navigator.toCall()
    }
}
