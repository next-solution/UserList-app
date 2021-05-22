//
//  UserViewModel.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import ServiceFramework

class UserViewModel {
    
    var endpoint: String
    var name: String
    var avatarUrl: String
    
    let avatarImage = Box(UIImage())
    let error = Box("")
    
    init(user: IUser, serviceType: Endpoint) {
        self.endpoint = serviceType.rawValue
        self.name = user.username
        self.avatarUrl = user.avatarUrl
    }
    
    func fetchAvatar() {
        guard let url = URL(string: avatarUrl) else { return }
        
        Fetcher.default.fetchAvatar(url: url) { [weak self] result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    self?.avatarImage.value = image
                }
            case .failure(let error):
                self?.error.value = error.description
            }
        }
    }
}
