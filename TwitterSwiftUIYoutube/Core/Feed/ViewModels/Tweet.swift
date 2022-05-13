//
//  Tweet.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/12.
//

import FirebaseFirestoreSwift
import Firebase
import Foundation

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    let likes: Int
    
    var user: User?
    var didLike: Bool? = false
}

