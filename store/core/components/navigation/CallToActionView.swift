//
//  CallToActionView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 16/02/24.
//

import SwiftUI

struct CallToActionView: View {
    var body: some View {
        HStack(){
            Text("Products of my team : ")
                .font(.subheadline)
                .bold()
            Text("change team")
                .font(.subheadline)
                .foregroundColor(Color.red)
                .bold()
            Spacer()
        }.padding()
    }
}

#Preview {
    CallToActionView()
}
