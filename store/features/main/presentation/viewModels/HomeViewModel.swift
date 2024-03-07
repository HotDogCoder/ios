//
//  HomeViewModel.swift
//  store
//
//  Created by Jorge Hospinal Flores on 19/02/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    private let auth_service: AuthService
    private var cancellables = Set<AnyCancellable>()
    @Published var errorMessage: String?

    init(auth_service: AuthService) {
            self.auth_service = auth_service
        }
    
    func get_product(username: String, password: String) {
    }
    
}
