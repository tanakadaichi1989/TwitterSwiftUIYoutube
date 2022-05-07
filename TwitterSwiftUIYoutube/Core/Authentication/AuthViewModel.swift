//
//  AuthViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/02.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: Firebase.User?
    
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: Did log user in \(self.userSession?.uid)")
        }
    }
    
    func register(withEmail email: String, password: String, fullname:String, username:String){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error  {
                print("DEBUG: Failed to register with \(error.localizedDescription)")
                return
            } else {
                guard let user = result?.user else { return }
                self.tempUserSession = user
                
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
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = self.tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid){ user in
            self.currentUser = user
        }
    }
}
