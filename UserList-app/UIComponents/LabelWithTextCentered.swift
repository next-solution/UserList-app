//
//  LabelWithTextCentered.swift
//  UserList-app
//
//  Created by Marcin Makurat on 22/05/2021.
//

import UIKit

class LabelWithTextCentered: UILabel {
    
    convenience init() {
        self.init(frame: .zero)
        textAlignment = .center
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
