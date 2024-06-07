//
//  LoginView.swift
//  photomate
//
//  Created by Иван Чернокнижников on 07.06.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // Logo Image
                Image("instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                VStack {
                    TextField("Enter your email",text: $email)
                        .autocapitalization(.none)
                        .modifier(FGTextFieldModifier())
                    
                    SecureField("Enter your password",text: $password)
                        .modifier(FGTextFieldModifier())
                }
                
                Button {
                    
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.trailing,28)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                
                
                Button {
                    
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360 ,height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                    
                }
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40,height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40,height: 0.5)
                }
                .foregroundColor(.gray)
                
                // FB Button
                
                HStack {
                    Text("Login with facebook")
                }
                Spacer()
                
                
                Divider()
                
                NavigationLink(destination: AddEmailView().navigationBarBackButtonHidden()) {
                    HStack(spacing: 3) {
                        Text("Don`t have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical,16)
            }
        }
    }
}

#Preview {
    LoginView()
}
