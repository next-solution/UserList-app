//
//  UserViewModel.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import ServiceFramework

class UserViewModel {
    var endpoint: Endpoint
    var name: String
    var avatarUrl: String
    var avatarImage: UIImage?
    
    init(user: IUser, serviceType: Endpoint) {
        self.endpoint = serviceType
        self.name = user.username
        self.avatarUrl = user.avatarUrl
    }
}
