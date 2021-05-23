//
//  UserViewModel.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import ServiceFramework
import Swinject

class UserViewModel {
    
    var endpoint: String
    var name: String
    var avatarUrl: String
    
    let avatarImage = Box(UIImage())
    let error = Box("")
    
    init(user: User, serviceType: Endpoint) {
        self.endpoint = serviceType.rawValue
        self.name = user.username
        self.avatarUrl = user.avatarUrl
    }
    
    func fetchAvatar() {
        guard let url = URL(string: avatarUrl) else { return }
        
        let fetcher = Assembler.default.resolver.resolve(FetcherProtocol.self, name: "Fetcher")
        fetcher?.fetchAvatar(url: url) { [weak self] result in
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
