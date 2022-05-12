//
//  ExploreViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/12.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchBarUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter {
                $0.username.contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery)
            }
        }
    }
    
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
