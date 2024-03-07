//
//  WelcomeView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 23/02/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var categories: [Item] = [
        .init(
            color: .red,
            title: "Market",
            sub_title: "Comida, bebida, licores compralos con tus puntos",
            image_url: "https://elements-cover-images-0.imgix.net/27908850-ba38-409c-999c-c38e134ce857?auto=compress%2Cformat&w=1170&fit=max&s=ae1c2637d75942d6e3980027b1593958",
            destination: MarketView()
        ),
        .init(
            color: .red,
            title: "Descuentos",
            sub_title: "giftcards y descuentos en las tiendas de nuestros socios",
            image_url: "https://elements-cover-images-0.imgix.net/1a976cb5-5fb0-4c35-a0e3-c1405f1b4376?auto=compress%2Cformat&w=1170&fit=max&s=32d65fd70161cadf07387588c321af75",
            destination: PointsView()
        ),
        .init(
            color: .red,
            title: "Equipos",
            sub_title: "Apoya a tu equipo y a otros que lo necesiten, comprando equipos que tengan en su lista",
            image_url: "https://elements-cover-images-0.imgix.net/e69f3d92-9dc3-43cf-8dde-0a73a7eb6c0a?auto=compress%2Cformat&w=1170&fit=max&s=22c4f0619749e6fc0f5408a496c97fb4",
            destination: TeamsView()
        )
    ]
    
    var body: some View {
        CustomPagingSliderView(data: $categories) { $item in
            NavigationLink {
                MarketView()
            } label: {
                SkeletonImageView(image_url_string: item.image_url,
                                  radius: 20) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 200, height: 200)
                }
            }
            
        } title_content: { $item in
            VStack(spacing: 5) {
                Text(item.title)
                    .font(.largeTitle.bold())
                Text(item.sub_title)
                    
            }.padding(.horizontal)
        }

        
    }
}

#Preview {
    WelcomeView()
}
