//
//  AuthenticationView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 21/02/24.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State private var showAnimations: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    SkeletonImageView(image_url_string: "https://elements-cover-images-0.imgix.net/e69f3d92-9dc3-43cf-8dde-0a73a7eb6c0a?auto=compress%2Cformat&w=1170&fit=max&s=22c4f0619749e6fc0f5408a496c97fb4", radius: 0, placeholder: {
                        
                    }).frame(width: 150, height: 150)
                    VStack (alignment: .leading) {
                        Text("Bienvenido a").font(.headline)
                        Text("Total Fan").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    }
                    Spacer()
                }
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Login").font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
                
                NavigationLink {
                    SignInView()
                } label: {
                    Text("Registrate").font(.headline)
                        .foregroundColor(.white)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
                .padding(.horizontal)
                
            }
            .padding()
        }
        .overlay {
            if #available(iOS 17, *) {
                CircleImageView(imageURL: "https://elements-cover-images-0.imgix.net/e69f3d92-9dc3-43cf-8dde-0a73a7eb6c0a?auto=compress%2Cformat&w=1170&fit=max&s=22c4f0619749e6fc0f5408a496c97fb4", x:100, y:-400).frame(width: 150, height: 150)
            } else {
                CircleImageView(imageURL: "https://elements-cover-images-0.imgix.net/e69f3d92-9dc3-43cf-8dde-0a73a7eb6c0a?auto=compress%2Cformat&w=1170&fit=max&s=22c4f0619749e6fc0f5408a496c97fb4", x:100, y:-400).frame(width: 150, height: 150)
            }
        }
    }
}

#Preview {
    AuthenticationView()
}
