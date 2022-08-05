//
//  BuyListViewController.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import UIKit

class BuyListViewController: BaseViewController {
    
    private lazy var buyListTableView: UITableView = {
        let view = UITableView()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullRefreshTrigger), for: .valueChanged)
        view.refreshControl = refreshControl
        view.register(UINib(nibName: ProductCell.reuseID, bundle: nil), forCellReuseIdentifier: ProductCell.reuseID)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel: BuyListViewModelType
    
    // MARK: - init
    
    init(viewModel: BuyListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - lift cycle
    
    override func loadView() {
        super.loadView()
        layoutViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadData()
    }
    
    private func layoutViews() {
        title = "Buy List"
        view.backgroundColor = .white
        view.addSubview(buyListTableView)
        NSLayoutConstraint.activate([
            buyListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buyListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buyListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buyListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func binding() {
        viewModel.productsDataChanged = {[weak self] products in
            self?.buyListTableView.refreshControl?.endRefreshing()
            self?.buyListTableView.reloadData()
        }
        
        viewModel.loadingTrigger = {[weak self] isLoading in
            if isLoading {
                self?.showActivityIndicator()
            } else {
                self?.hideActivityIndicator()
            }
        }
    }
    
    // MARK: - Action
    
    @objc private func pullRefreshTrigger() {
        viewModel.reloadData()
    }
}

extension BuyListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ProductCell.self, at: indexPath)
        cell.config(product: viewModel.products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didTapProduct(product: viewModel.products[indexPath.row])
    }
}
