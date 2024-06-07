//
//  ProfileHeaderView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        VStack(spacing: 10) {
            // PIC & STATS
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width:  80,height: 80)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
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
            
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360,height:32)
                    .foregroundColor(.black)
                    .overlay( RoundedRectangle(cornerRadius: 6).stroke(Color.gray,lineWidth: 1))
            }
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
