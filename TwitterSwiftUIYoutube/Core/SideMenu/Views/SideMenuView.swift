//
//  SideMenuView.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/01.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            sideMenuHeader
            sideMenuButtons
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

extension SideMenuView {
    var sideMenuHeader: some View {
        VStack(alignment: .leading) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Bruce Wayne")
                    .font(.headline)
                
                Text("batman")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.leading)
    }
    
    var sideMenuButtons: some View {
        ForEach(SideMenuViewModel.allCases, id: \.rawValue) { sideMenu in
            if sideMenu == .profile {
                NavigationLink {
                    ProfileView()
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
    }
}
