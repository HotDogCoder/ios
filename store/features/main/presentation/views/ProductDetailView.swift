//
//  HomeView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 9/02/24.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var items: [Item] = [
        .init(
            color: .red,
            title: "Reciclaje",
            sub_title: "No se que poner aca",
            image_url: "https://getbackperu.digital/assets/images/banner/banner.webp",
            destination: nil
        ),
        .init(
            color: .red,
            title: "Importancia",
            sub_title: "No se que poner aca",
            image_url: "https://getbackperu.digital/assets/images/general/1.jpeg",
            destination: nil
        )
    ]
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            
            SliderCardView(price: "USD 400", title: "Something expensive - PERU-AL", description: "this description is an example", reviews: "reviews 300", stars: 5, radius: 20, items: items)
            
        })
    }
}

#Preview {
    ProductDetailView()
}
