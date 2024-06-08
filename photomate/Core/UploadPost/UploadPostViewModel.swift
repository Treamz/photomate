//
//  UploadPostViewModel.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI
import PhotosUI

import Firebase
@MainActor
class UploadPostViewModel : ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { 
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else {return}
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
        
    }
    
    
    func uploadPost(captiong: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        
        guard let uiImage = uiImage else {return}
        
        let postRef = Firestore.firestore().collection("posts").document()
        
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else {return}
        let post = Post(id: postRef.documentID, ownerUid: currentUid, caption: captiong, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        
        try await postRef.setData(encodedPost)
    }
}
