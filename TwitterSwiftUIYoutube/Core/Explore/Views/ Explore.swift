//
//  ExploreView.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/04/30.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(0...25 ,id: \.self){ _ in
                        NavigationLink {
                            if let user = viewModel.currentUser {
                                ProfileView(user: user)
                            }
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
}

struct ExporeView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
