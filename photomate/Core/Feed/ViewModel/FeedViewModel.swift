//
//  FeedViewModel.swift
//  photomate
//
//  Created by Иван Чернокнижников on 08.06.2024.
//

import Foundation
import Firebase

class FeedViewModel : ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task {
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        
        self.posts =  try snapshot.documents.compactMap({ doc in
            let post = try doc.data(as: Post.self)
            return post
        })
        
        for i in 0  ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await  UserService.fetchUser(withUserId: ownerUid)
            posts[i].user = postUser
        }
    
    }
}
