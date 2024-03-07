//
//  PaymentMethodView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 19/02/24.
//

import SwiftUI

struct PaymentMethodView: View {
    let paymentMethod: PaymentMethod

    var body: some View {
        NavigationLink(destination: PaymentMethodDetailView(paymentMethod: paymentMethod)) {
            HStack(spacing: 15) {
                Image(systemName: paymentMethod.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                
                Text(paymentMethod.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}
