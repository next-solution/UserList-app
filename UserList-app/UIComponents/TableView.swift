//
//  TableView.swift
//  UserList-app
//
//  Created by Marcin Makurat on 22/05/2021.
//

import UIKit

class TableView: UITableView {
    
    convenience init() {
        self.init(frame: .zero, style: .grouped)
        translatesAutoresizingMaskIntoConstraints = false
        separatorStyle = .singleLine
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        allowsSelection = true
        allowsMultipleSelection = false
    }
}
