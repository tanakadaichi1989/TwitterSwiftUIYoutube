//
//  ProfilePhotoSelectorView.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/03.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Create your account",
                                     title2: "Select a profile photo")
            Button {
               print("Pick image here ...")
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color(.systemBlue))
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .padding(.top,44)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
