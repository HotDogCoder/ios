//
//  MethodsView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 19/02/24.
//

import SwiftUI

struct AddCreditCardView: View {
    
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ScrollView {
            HStack(alignment: .center){
                SkeletonImageView(image_url_string: "https://elements-cover-images-0.imgix.net/4c523d6b-8f4d-4eab-8636-03477afd223a?auto=compress%2Cformat&w=1170&fit=max&s=96595c223db8d6278eea920a7128599c", radius: 0, placeholder: {
                    
                }).frame(width: 60)
                Text("Metodos de pago").font(.title).bold()
                Spacer()
            }.padding()
            Text("Por seguridad, no guardamos tu CVV nuestros datos, tendras que ingresarlo manualmente cada vez")
                .padding()
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                SkeletonImageView(image_url_string: "https://elements-cover-images-0.imgix.net/3eff07c5-f781-4a4f-b024-39869a1fdee0?auto=compress%2Cformat&w=1170&fit=max&s=e6c1e46880cc6f96eb11ae455d39bfe3", radius: 0, placeholder: {
                    
                })
            }).frame(width: 200)
                .padding(.horizontal)
            StarbucksTextField(placeholder: "N° de tarjeta", text: $username)
                .padding(.bottom)
                .padding(.horizontal)
            StarbucksTextField(placeholder: "Nombre", text: $password)
                .padding(.bottom)
                .padding(.horizontal)
            HStack() {
                StarbucksTextField(placeholder: "MM/YYYY", text: $username)
                
                StarbucksTextField(placeholder: "CVV", text: $password)
            }
            .padding(.bottom)
            .padding(.horizontal)
            
            Button(action: {
                // Perform login action
                // viewModel.login(username: username, password: password)
                
            }) {
                Text("Guardar")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.bottom)
            .padding(.horizontal)
        }
        
        
        
    }
}

#Preview {
    AddCreditCardView()
}
