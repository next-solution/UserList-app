//
//  UserListViewController.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import UIKit

class UserListViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let refreshControl = UIRefreshControl()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private let errorStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configureTableView()
        
        viewModel.users.bind { [weak self] users in
            self?.tableView.reloadData()
        }
        
        self.viewModel.avatar.bind { [weak self] (cellAddress, image) in
            let cell = self?.tableView.visibleCells.first(where: { String(format: "%p", unsafeBitCast($0, to: Int.self)) == cellAddress }) as? TableViewCell
            cell?.avatarImageView.image = image
        }
        
        viewModel.fetchUsers()
    }
    
    func configureTableView() {
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
        
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        view.addSubview(errorStackView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            errorStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            errorStackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            errorStackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.topAnchor.constraint(equalTo: errorStackView.bottomAnchor, constant: 0).isActive = true
        tableView.tableHeaderView?.frame.size = CGSize(width: tableView.frame.width, height: 0)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let item = viewModel.users.value[index]
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.usernameLabel.text  = item.name
        
        cell.layoutIfNeeded()
        cell.layoutSubviews()
        cell.contentView.superview?.clipsToBounds = true
        
        let cellAddress = String(format: "%p", unsafeBitCast(cell, to: Int.self))
        viewModel.fetchAvatar(url: item.avatarUrl, cellAddress: cellAddress)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value.count
    }
    
    @objc private func refreshData(_ sender: Any) {
        // TODO
    }
}

