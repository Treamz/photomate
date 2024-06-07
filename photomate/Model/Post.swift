//
//  Post.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id : String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
    
}

extension Post {
    static var MOCK_POSTS : [Post] = [
        .init(id: UUID().uuidString, ownerUid: "1", caption: "Wakanda Forever", likes: 2, imageUrl: "profile", timestamp: Date(),user: User(id: UUID().uuidString ,username: "betman", email: "tony@gmail.com")),
        .init(id: UUID().uuidString, ownerUid: "2", caption: "Hello Forever", likes: 22, imageUrl: "profile", timestamp: Date()),
        .init(id: UUID().uuidString, ownerUid: "3", caption: "World Forever", likes: 12, imageUrl: "profile", timestamp: Date()),
        .init(id: UUID().uuidString, ownerUid: "4", caption: "War Forever", likes: 13, imageUrl: "profile", timestamp: Date()),
        .init(id: UUID().uuidString, ownerUid: "5", caption: "Me Forever", likes: 24, imageUrl: "profile", timestamp: Date()),
    ]
}
