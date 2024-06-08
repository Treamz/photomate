//
//  EditProfileViewModel.swift
//  photomate
//
//  Created by Иван Чернокнижников on 08.06.2024.
//

import Foundation
import PhotosUI
import SwiftUI
import FirebaseFirestore

@MainActor
class EditProfileViewModel : ObservableObject {
    
    @Published var user : User
        
    @Published var fullname = ""

    @Published var bio = ""
    
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var profileImage: Image?
    
    
    private var uiImage: UIImage?
    init(user: User) {
        self.user = user
        
        if let fullName = user.fullName {
            self.fullname = fullName
        }
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        // update profile name if changed
        
        var data = [String: Any]()
        
        if let profileImage = profileImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !fullname.isEmpty && user.fullName != fullname {
            data["fullName"] = fullname
        }
        
        // update profile bio if changed
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if(!data.isEmpty) {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
        
        let _ = try await AuthService.shared.loadUserData()
    }
}
