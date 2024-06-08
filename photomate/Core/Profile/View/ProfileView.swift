//
//  ProfileView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    

//   @StateObject private var viewModel = 
    var body: some View {
        ScrollView {
            // HEADER
            ProfileHeaderView(user: user)
            // POST GRID
            
            PostGridView(user: user)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
       
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
