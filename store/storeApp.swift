// storeApp.swift
import SwiftUI

@main
struct storeApp: App {
    
    let authManager = AuthenticationManager() // Instantiate AuthenticationManager
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager) // Pass authManager as an environment object
        }
    }
}
