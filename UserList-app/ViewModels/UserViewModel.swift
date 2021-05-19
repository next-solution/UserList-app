//
//  UserViewModel.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import ServiceFramework

class UserViewModel {
    var serviceType: ServiceType
    var name: String
    var avatarUrl: String
    var avatarImage: UIImage?
    
    init(user: IUser, serviceType: ServiceType) {
        self.serviceType = serviceType
        self.name = user.username
        self.avatarUrl = user.avatarUrl
    }
}
