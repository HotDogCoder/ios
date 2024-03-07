//
//  StarbucksTextField.swift
//  store
//
//  Created by Jorge Hospinal Flores on 10/02/24.
//

import Foundation

import SwiftUI

struct StarbucksTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(height: 50)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            
            TextField(placeholder, text: $text)
                .padding(.horizontal, 20)
                .foregroundColor(.black)
        }
    }
}
