//
//  AuthViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/02.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String){
        print("DEBUG: Login with \(email)")
    }
    
    func register(withEmail email: String, password: String, fullname:String, username:String){
        print("DEBUG: Register with \(email)")
    }
}
