//
//  ProfileHeaderView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State private var showEditProfile = false
    let user: User
    var body: some View {
        VStack(spacing: 10) {
            // PIC & STATS
            HStack {
                CircularProfileImageView(user: user,size: .large)
            
                Spacer()
                HStack(spacing: 8) {
                    UserStatView(value: 3, title: "Posts")
                    
                    UserStatView(value: 3, title: "Followes")
                    
                    UserStatView(value: 3, title: "Following")
                 
                }
            }
            .padding(.horizontal)
            
            // NAME & BIO
            VStack(alignment: .leading,spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
              
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal)
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }
                else {
                    
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360,height:32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay( RoundedRectangle(cornerRadius: 6).stroke(user.isCurrentUser ? Color.gray : .clear ,lineWidth: 1))
            }
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
