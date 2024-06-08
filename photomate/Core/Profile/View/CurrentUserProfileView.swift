//
//  CurrentUserProfileView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {

    let user: User
    var posts: [Post]  {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    var body: some View {
        NavigationView {
            ScrollView {
                // HEADER
                ProfileHeaderView(user: user)
                // POST GRID
                
                PostGridView(user: user)

            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
