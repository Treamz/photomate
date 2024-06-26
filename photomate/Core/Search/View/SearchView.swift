//
//  SearchView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .small)
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullname = user.fullName {
                                        Text(fullname)
                                    }
                                }
                                Spacer()
                            }
                            .foregroundStyle(.black)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top,8)
                .searchable(text: $searchText,prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
