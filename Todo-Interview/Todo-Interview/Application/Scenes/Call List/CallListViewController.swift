//
//  CallListViewController.swift
//  Todo-Interview
//
//  Created by Dat Van on 04/08/2022.
//

import UIKit

class CallListViewController: BaseViewController {
    
    private lazy var callListTableView: UITableView = {
        let view = UITableView()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullRefreshTrigger), for: .valueChanged)
        view.refreshControl = refreshControl
        view.register(UINib(nibName: "UserCallCell", bundle: nil), forCellReuseIdentifier: UserCallCell.reuseID)
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel: CallListViewModelType
    
    // MARK: - init
    
    init(viewModel: CallListViewModelType) {
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
        title = "Call List"
        view.backgroundColor = .white
        view.addSubview(callListTableView)
        NSLayoutConstraint.activate([
            callListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            callListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            callListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            callListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func binding() {
        viewModel.userDataChanged = {[weak self] users in
            self?.callListTableView.refreshControl?.endRefreshing()
            self?.callListTableView.reloadData()
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

extension CallListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: UserCallCell.self, at: indexPath)
        cell.config(user: viewModel.users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didTapUser(user: viewModel.users[indexPath.row])
    }
}
