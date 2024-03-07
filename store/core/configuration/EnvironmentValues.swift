//
//  EnvironmentValues.swift
//  store
//
//  Created by Jorge Hospinal Flores on 21/02/24.
//
import SwiftUI

extension EnvironmentValues {
    var authenticationManager: AuthenticationManager {
        get { self[AuthenticationManagerKey.self] }
        set { self[AuthenticationManagerKey.self] = newValue }
    }
}
