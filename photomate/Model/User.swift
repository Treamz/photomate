//
//  User.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    
}


extension User {
    static var MOCK_USERS : [User] = [
        .init(id: NSUUID().uuidString, username: "betman",profileImageUrl: "profile", fullName: "Ivan Chernoknizhnikov",bio: "Hello FireGram", email: "betman@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "ironman",profileImageUrl: "profile", fullName: "Tony Stark",bio: "Hello FireGram", email: "tony@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "thor",profileImageUrl: "profile", fullName: "Odin Son",bio: "Hello FireGram", email: "thor@gmail.com")
    ]
    
}
