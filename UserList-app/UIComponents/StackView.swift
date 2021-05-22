//
//  VerticalStackView.swift
//  UserList-app
//
//  Created by Marcin Makurat on 22/05/2021.
//

import UIKit

class StackView: UIStackView {
    
    convenience init() {
        self.init(frame: .zero)
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
    }
}
