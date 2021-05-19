//
//  UITableViewCell+ReuseIdentifier.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
