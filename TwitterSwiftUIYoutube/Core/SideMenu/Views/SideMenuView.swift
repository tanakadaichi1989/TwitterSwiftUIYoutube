//
//  SideMenuView.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/01.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                //sideMenuHeader
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                //sideMenuButtons
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { sideMenu in
                    if sideMenu == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: sideMenu)
                        }
                    } else if sideMenu == .logout {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(viewModel: sideMenu)
                        }
                    } else {
                        SideMenuOptionRowView(viewModel: sideMenu)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
