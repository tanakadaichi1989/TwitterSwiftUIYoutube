//
//  ExploreView.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/04/30.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0...25 ,id: \.self){ _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ExporeView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
