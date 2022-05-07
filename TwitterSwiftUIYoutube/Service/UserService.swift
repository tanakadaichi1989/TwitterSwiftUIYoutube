//
//  UserService.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/05.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                print("User name is \(user.username)")
                completion(user)
            }
        
    }
}
