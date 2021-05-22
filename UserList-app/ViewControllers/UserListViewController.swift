//
//  UserListViewController.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import UIKit

class UserListViewController: ViewController {
    
    private let viewModel = UserListViewModel()
    
    private let refreshControl = UIRefreshControl()
    private let tableView = TableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        viewModel.fetchUsers()
        bindData()
        configureTableView()
        setupLayout()
    }
    
    func bindData() {
        viewModel.users.bind { [weak self] users in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    func configureTableView() {
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }
    
    func setupLayout() {
        tableView.addSubview(refreshControl)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    @objc private func refreshData(_ sender: Any) {
        viewModel.fetchUsers()
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.users.value[indexPath.row]
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        
        cell.usernameLabel.text = item.name
        cell.endpointLabel.text = item.endpoint
        cell.viewModel = item
        cell.bindData()
        item.fetchAvatar()
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value.count
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UserDetailsViewController(viewModel: viewModel.users.value[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

