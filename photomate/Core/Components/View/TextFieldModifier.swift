//
//  TextFieldModifier.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI


struct FGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6 ))
            .cornerRadius(12)
            .padding(.horizontal,24)
    }
    
}
