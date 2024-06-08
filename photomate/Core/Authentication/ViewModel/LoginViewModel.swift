//
//  LoginViewModel.swift
//  photomate
//
//  Created by Иван Чернокнижников on 08.06.2024.
//

import Foundation


class LoginViewModel : ObservableObject {
    
    @Published var email: String = ""
    @Published var password : String = ""
    
    
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
