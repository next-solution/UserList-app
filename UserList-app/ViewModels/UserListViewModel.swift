//
//  UserListViewModel.swift
//  UserList-app
//
//  Created by Marcin Makurat on 19/05/2021.
//

import ServiceFramework
import Swinject

class UserListViewModel {
    
    let users = Box([UserViewModel]())
    let error = Box("")
    
    private let lock = NSLock()
    
    func fetchUsers() {
        users.value = []
        
        let fetcher = Assembler.default.resolver.resolve(FetcherProtocol.self, name: "Fetcher")
        fetcher?.fetchInfoAboutUsers() { [weak self] result in
            for userList in result {
                switch userList.users {
                case .success(let users):
                    self?.users.value.append(contentsOf: users.compactMap { user in UserViewModel(user: user, serviceType: userList.endpoint) })
                case .failure(let error):
                    self?.error.value = error.description
                }
            }
        }
    }
}
