//
//  Profile.swift
//  store
//
//  Created by Jorge Hospinal Flores on 20/02/24.
//

import Foundation
import SwiftUI

class AuthenticationManager: ObservableObject {
    @Published var access: String?
    @Published var refresh: String?
    @Published var user_name: String?
    @Published var user_email: String?
    
    init(access: String,refresh: String, user_name: String, user_email: String) {
        self.access = access
        self.refresh = refresh
        self.user_name = user_name
        self.user_email = user_email
    }
    
    func log_out() {
        self.access = ""
        self.refresh =  ""
        self.user_name = ""
        self.user_email = ""
    }
    
    init() {
        if let access = UserDefaults.standard.string(forKey: "access"),
           let refresh = UserDefaults.standard.string(forKey: "refresh"),
           let user_name = UserDefaults.standard.string(forKey: "user_name"),
           let user_email = UserDefaults.standard.string(forKey: "user_email") {
            self.access = access
            self.refresh = refresh
            self.user_name = user_name
            self.user_email = user_email
        }
    }
}
