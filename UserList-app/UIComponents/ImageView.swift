//
//  ImageView.swift
//  UserList-app
//
//  Created by Marcin Makurat on 22/05/2021.
//

import UIKit

class ImageView: UIImageView {
    
    convenience init() {
        self.init(frame: .zero)
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
}
