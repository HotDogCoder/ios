//
//  PaymentMethodDetailView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 19/02/24.
//

import SwiftUI

struct PaymentMethodDetailView: View {
    let paymentMethod: PaymentMethod

    var body: some View {
        if paymentMethod.name == "Credit Card" {
            AddCreditCardView()
        } else {
            VStack {
                Text("Payment Method Details")
                    .font(.title)
                    .padding()
                
                // Display payment method details
                HStack {
                    Image(systemName: paymentMethod.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    
                    Text(paymentMethod.name)
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                }
                
                // Add more details if needed
            }.padding()
        }
    }
}
