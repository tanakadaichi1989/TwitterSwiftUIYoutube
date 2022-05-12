//
//  FeedViewModel.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/12.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets { tweets in
            self.tweets = tweets
            tweets.forEach { tweet in
                let uid = tweet.uid
                
                for i in 0 ..< tweets.count {
                    let uid = tweets[i].uid
                    
                    
                    self.userService.fetchUser(withUid: uid) { user in
                        self.tweets[i].user = user
                    }
                }
            }
        }
    }
}
