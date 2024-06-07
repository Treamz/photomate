//
//  ProfileView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    

    
    var posts: [Post]  {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    var body: some View {
        ScrollView {
            // HEADER
            ProfileHeaderView(user: user)
            // POST GRID
            
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
