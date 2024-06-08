//
//  UploadPostView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI
import PhotosUI
struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @State private var photoItem : PhotosPickerItem?
    @Binding var tabIndex: Int
    @StateObject var viewModel = UploadPostViewModel()
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            // Header
            HStack {
                Button("Cancel") {
                    clearPostDataAndReturnToFeed()
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button() {
                    Task {
                        try await viewModel.uploadPost(captiong:caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            // Post image & caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption",text: $caption,axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
        dismiss()
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
