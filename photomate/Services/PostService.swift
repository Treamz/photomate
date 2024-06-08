//
//  PostService.swift
//  photomate
//
//  Created by Иван Чернокнижников on 08.06.2024.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    static func fetchFeedPosts() async throws  -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        
        var posts =  try snapshot.documents.compactMap({ doc in
            let post = try doc.data(as: Post.self)
            return post
        })
        
        for i in 0  ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await  UserService.fetchUser(withUserId: ownerUid)
            posts[i].user = postUser
        }
        return posts
    
    }
    
    static func fetchUserPosts(uid: String)  async throws  -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ doc in
            let post = try doc.data(as: Post.self)
            return post
        })
    }
}
