//
//  User.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/05.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
