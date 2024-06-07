//
//  CompleteSignUpView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss

    
    @State private var password = ""
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("Welcome to instagram, Ivan Chernoknizhnikov")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration and start using instagram")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
        
            
            Button {
                
            } label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360 ,height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
                
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CompleteSignUpView()
}
