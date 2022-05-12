//
//  ExploreViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/12.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
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
