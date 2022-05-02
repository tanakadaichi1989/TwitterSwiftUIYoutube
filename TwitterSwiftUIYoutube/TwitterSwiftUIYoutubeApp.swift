//
//  TwitterSwiftUIYoutubeApp.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/04/23.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIYoutubeApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView()
            }
        }
    }
}
