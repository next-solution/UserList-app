//
//  TableViewCell.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let avatarImageView = UIImageView()
    let usernameLabel = UILabel()
    var baseLabelConstraitns = [NSLayoutConstraint]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 19),
            avatarImageView.heightAnchor.constraint(equalToConstant: 19),
            avatarImageView.widthAnchor.constraint(equalToConstant: 19),
            
            
            usernameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 7),
            usernameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -7),
            usernameLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: 5),
            
            ])
        
    }
    
}
