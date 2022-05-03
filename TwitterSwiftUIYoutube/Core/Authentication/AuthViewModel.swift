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
    @Published var didAuthenticateUser = false
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in ...")
        }
    }
    
    func register(withEmail email: String, password: String, fullname:String, username:String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error  {
                print("DEBUG: Failed to register with \(error.localizedDescription)")
                return
            } else {
                guard let user = result?.user else { return }
                
                print("DEBUG: Registered user successfully")
                print("DEBUG: User is \(self.userSession)")
                
                let data = ["email": email,
                            "username": username.lowercased(),
                            "fullname": fullname,
                            "uid": user.uid]
                
                Firestore.firestore().collection("users")
                    .document(user.uid)
                    .setData(data){ _ in
                        self.didAuthenticateUser = true
                    }
            }
        }
    }
    
    func signOut(){
        userSession = nil
        // try? Auth.auth().signOut()
    }
}
