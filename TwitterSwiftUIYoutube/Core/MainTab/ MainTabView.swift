//
//  MaintabView.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/04/30.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex){
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)

            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag(2)

            MassagesView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(3)

        }
    }
}

struct MaintabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
