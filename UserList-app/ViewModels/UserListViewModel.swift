//
//  UserListViewModel.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import ServiceFramework

class UserListViewModel {
    
    let users = Box([UserViewModel]())
    let avatar = Box(("cellAddress", UIImage()))
    let error = Box("")
    
    private let lock = NSLock()
    private static var avatarUrlStore = [String: URL]()
    
    func fetchUsers() {
        users.value = []
        
        Fetcher.default.fetchInfoAboutUsers(endpoint: .dailyMotion) { [weak self] result in
            switch result {
            case .success(let users):
                self?.addUsers(users, service: .dailyMotion)
            case .failure(let error):
                self?.error.value = error.description
            }
        }
        
        Fetcher.default.fetchInfoAboutUsers(endpoint: .gitHub) { [weak self] result in
            switch result {
            case .success(let users):
                self?.addUsers(users, service: .gitHub)
            case .failure(let error):
                self?.error.value = error.description
            }
        }
    }
    
    func fetchAvatar(url: String, cellAddress: String) {
        guard let url = URL(string: url) else { return }
        
        UserListViewModel.avatarUrlStore[cellAddress] = url
        
        Fetcher.default.fetchAvatar(url: url) { [weak self] result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data), UserListViewModel.avatarUrlStore[cellAddress] == url {
                    self?.avatar.value = (cellAddress, image)
                }
            case .failure(let error):
                self?.error.value = error.description
            }
        }
    }
    
    private func addUsers(_ users: [IUser], service: Endpoint) {
        lock.lock()
        self.users.value.append(contentsOf: users.compactMap { user in UserViewModel(user: user, serviceType: service) })
        lock.unlock()
    }
}
