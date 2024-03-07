//
//  ContentView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 9/02/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    
    var body: some View {
        VStack {
            if (authManager.access != nil && authManager.access != "") {
                NavigationStack() {
//                    List {
//                        NavigationLink("Home") {
//                            HomeView()
//                        }
//                        NavigationLink("Mis Equipos") {
//                            TeamsView()
//                        }
//                        NavigationLink("Metodos de Pago") {
//                            PaymentMethodsView(paymentMethods: [
//                                PaymentMethod(name: "Credit Card", icon: "creditcard"),
//                                PaymentMethod(name: "PayPal", icon: "dollarsign.square")
//                            ])
//                        }
//                        NavigationLink("Mis movimientos") {
//                            HomeView()
//                        }
//                    }
//                    .navigationTitle("Bienvenido :")
//                    Text(authManager.user_email ?? "XD")
//
//                    HStack (alignment: .center, spacing: 10) {
//                        Button("Log out") {
//                            authManager.log_out()
//                        }
//                    }
                    WelcomeView()
                }
            } else {
                AuthenticationView()
            }
        }
    };
}
