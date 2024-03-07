//
//  SignInView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 9/02/24.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var view_model: AuthenticationViewModel = AuthenticationViewModel()
    @EnvironmentObject var authManager: AuthenticationManager
        
    @State private var email = ""
    @State private var password1 = ""
    @State private var password2 = ""
    
    var body: some View {
        VStack {
            HStack {
                SkeletonImageView(image_url_string: "https://elements-cover-images-0.imgix.net/e69f3d92-9dc3-43cf-8dde-0a73a7eb6c0a?auto=compress%2Cformat&w=1170&fit=max&s=22c4f0619749e6fc0f5408a496c97fb4", radius: 0, placeholder: {
                    
                }).frame(width: 150, height: 150)
                VStack (alignment: .leading) {
                    Text("Total Fan").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    Text("Registrate").font(.headline)
                }
                
                Spacer()
            }
            StarbucksTextField(placeholder: "Email", text: $email)
                .padding(.horizontal)
            
            StarbucksTextField(placeholder: "Password", text: $password1)
                .padding(.horizontal)
            
            StarbucksTextField(placeholder: "Repeat Password", text: $password2)
                .padding(.horizontal)
            
            Button(action: {
                // Perform login action
                self.view_model.sign_in(email: email, password1: password1, password2: password2)
                // view_model.setAuthenticated()
                
            }) {
                Text("Registrarme")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            .onChange(of: view_model.access) {
                        // This closure will be called whenever the access token changes
                        // Update authManager with the latest values
                        authManager.access = view_model.access
                        authManager.refresh = self.view_model.refresh
                        authManager.user_name = self.view_model.user_name
                        authManager.user_email = self.view_model.user_email
                    }
            
            // Error message display
            if let successMessage = self.view_model.detail {
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Ir al Login").font(.headline)
                        .foregroundColor(.white)
                        
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
                Text(successMessage)
                    .foregroundColor(.green)
            }
            
            // Error message display
            if let errorMessage = self.view_model.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    AuthenticationView()
}
