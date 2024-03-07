//
//  MyMethodsView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 19/02/24.
//

import SwiftUI

struct PaymentMethod: Identifiable {
    let id = UUID()
    let name: String
    let icon: String // Name of the image asset
}

struct PaymentMethodsView: View {
    let paymentMethods: [PaymentMethod]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Payment Methods")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)

            ForEach(paymentMethods) { method in
                PaymentMethodView(paymentMethod: method)
                    .padding(.vertical, 8)
            }
        }
        .padding()
    }
}

struct PaymentMethodsListView_Previews: PreviewProvider {
    static var previews: some View {
        let paymentMethods = [
            PaymentMethod(name: "Credit Card", icon: "creditcard.fill"),
            PaymentMethod(name: "PayPal", icon: "dollarsign.square.fill")
        ]
        
        return PaymentMethodsView(paymentMethods: paymentMethods)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
