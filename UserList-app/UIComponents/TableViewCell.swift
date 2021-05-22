//
//  TableViewCell.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import UIKit
import ServiceFramework

class TableViewCell: UITableViewCell {
    
    var viewModel: UserViewModel?
    
    let avatarImageView = ImageView()
    let usernameLabel = LabelWithTextCentered()
    let endpointLabel = LabelWithTextCentered()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        endpointLabel.textColor = .darkGray
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        addSubview(endpointLabel)
        
        NSLayoutConstraint.activate([
            
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 48),
            avatarImageView.widthAnchor.constraint(equalToConstant: 48),
            
            usernameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            usernameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 7),
            usernameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -7),
            
            endpointLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            endpointLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 7),
            endpointLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -7),
            endpointLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
        
    }
    
    func bindData() {
        viewModel?.avatarImage.bind { [weak self] image in
            self?.avatarImageView.image = image
        }
    }
}
