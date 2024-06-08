//
//  UserService.swift
//  photomate
//
//  Created by Иван Чернокнижников on 08.06.2024.
//

import Foundation
import FirebaseFirestore
struct UserService {
    static func fetchAllUsers() async throws -> [User] {
//        var users = [User]()
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
//        for doc in documents {
//            guard let user = try? doc.data(as: User.self) else {return users}
//            users.append(user)
//        }
        
        
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
