//
//  ProfileView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems : [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                // HEADER
                VStack(spacing: 10) {
                    // PIC & STATS
                    HStack {
                       Image("profile")
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
                        Text("Ivan Chernoknizhnikov")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Wakanda Forever")
                            .font(.footnote)
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
                // POST GRID
                
                LazyVGrid(columns: gridItems,spacing: 1) {
                    ForEach(0 ... 15,id: \.self) { index in
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
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
    ProfileView()
}
