//
//  UserListViewModel.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import ServiceFramework

class UserListViewModel {
    
    let users = Box([UserViewModel]())
    let error = Box("")
    
    private let lock = NSLock()
    
    func fetchUsers() {
        users.value = []
        
        DailyMotionFetcher.default.fetchInfoAboutUsers() { result in
            switch result {
            case .success(let users):
                self.addUsers(users, service: .dailyMotion)
            case .failure(let error):
                self.error.value = error.description
            }
        }
        
        GithubFetcher.default.fetchInfoAboutUsers() { result in
            switch result {
            case .success(let users):
                self.addUsers(users, service: .gitHub)
            case .failure(let error):
                self.error.value = error.description
            }
        }
    }
    
    func fetchAvatar(url: String) {
        guard let url = URL(string: url) else { return }
        GithubFetcher.default.fetchAvatar(url: url) { [weak self] result in
            switch result {
            case .success(let data):
                let image = UIImage(data: data)
                self?.users.value.first(where: { $0.avatarUrl == url.absoluteString })?.avatarImage = image
            case .failure(let error):
                self?.error.value = error.description
            }
            
        }
    }
    
    private func addUsers(_ users: [IUser], service: ServiceType) {
        lock.lock()
        self.users.value.append(contentsOf: users.compactMap { user in UserViewModel(user: user, serviceType: service) })
        lock.unlock()
    }
}
