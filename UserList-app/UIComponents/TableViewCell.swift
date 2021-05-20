//
//  TableViewCell.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import UIKit
import ServiceFramework

class TableViewCell: UITableViewCell {
    
    let avatarImageView = UIImageView()
    let usernameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func setupConstraints() {
    
    addSubview(avatarImageView)
    addSubview(usernameLabel)
    
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 19),
            avatarImageView.heightAnchor.constraint(equalToConstant: 19),
            avatarImageView.widthAnchor.constraint(equalToConstant: 19),
            
            
            usernameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 7),
            usernameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -7),
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            ])
        
    }
}
