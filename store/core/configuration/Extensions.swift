//
//  Extensions.swift
//  store
//
//  Created by Jorge Hospinal Flores on 21/02/24.
//
import SwiftUI

extension View {
    func authenticationManager(_ manager: AuthenticationManager) -> some View {
        environment(\.authenticationManager, manager)
    }
}
