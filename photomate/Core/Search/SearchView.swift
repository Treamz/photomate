//
//  SearchView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0...15,id: \.self) { user in
                        HStack {
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                            VStack(alignment: .leading) {
                                Text("Betman")
                                    .fontWeight(.semibold)
                                Text("Bruce")
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top,8)
                .searchable(text: $searchText,prompt: "Search...")
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}