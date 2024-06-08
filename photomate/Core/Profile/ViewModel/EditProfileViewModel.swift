//
//  EditProfileViewModel.swift
//  photomate
//
//  Created by Иван Чернокнижников on 08.06.2024.
//

import Foundation
import PhotosUI
import SwiftUI
@MainActor
class EditProfileViewModel : ObservableObject {
    
    @Published var user : User
        
    @Published var name = ""

    @Published var bio = ""
    
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var profileImage: Image?
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        // update profile name if changed
        
        var data = [String: Any]()
        
        if !name.isEmpty && user.fullName != name {
            data["fullname"] = name
        }
        
        // update profile bio if changed
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
    }
}
