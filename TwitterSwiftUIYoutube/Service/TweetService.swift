//
//  TweetService.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/12.
//

import Firebase
import FirebaseFirestore

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    func fetchTweets() {
        Firestore.firestore().collection("tweets").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            documents.forEach { doc in
                print(doc.data())
            }
        }
    }
}
