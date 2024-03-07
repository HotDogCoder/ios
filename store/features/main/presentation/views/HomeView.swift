//
//  HomeView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 9/02/24.
//

import SwiftUI

struct HomeView: View {
    @State private var categories: [Item] = [
        .init(
            color: .red,
            title: "Market",
            sub_title: "Comida, bebida, licores compralos con tus puntos",
            image_url: "https://elements-cover-images-0.imgix.net/27908850-ba38-409c-999c-c38e134ce857?auto=compress%2Cformat&w=1170&fit=max&s=ae1c2637d75942d6e3980027b1593958",
            destination: nil
        ),
        .init(
            color: .red,
            title: "Canjes %",
            sub_title: "giftcards y descuentos en las tiendas de nuestros socios",
            image_url: "https://elements-cover-images-0.imgix.net/1a976cb5-5fb0-4c35-a0e3-c1405f1b4376?auto=compress%2Cformat&w=1170&fit=max&s=32d65fd70161cadf07387588c321af75",
            destination: nil
        ),
        .init(
            color: .red,
            title: "Equipos",
            sub_title: "Apoya a tu equipo y a otros que lo necesiten, comprando equipos que tengan en su lista",
            image_url: "https://elements-cover-images-0.imgix.net/e69f3d92-9dc3-43cf-8dde-0a73a7eb6c0a?auto=compress%2Cformat&w=1170&fit=max&s=22c4f0619749e6fc0f5408a496c97fb4",
            destination: nil
        )
    ]
    
    @State private var products: [Item] = [
        .init(
            color: .red,
            title: "Hamburguesa",
            sub_title: "No se que poner aca",
            image_url: "https://www.vivirbiencolmedica.com/wp-content/uploads/2022/09/comida-chatarra.jpg",
            destination: nil
        ),
        .init(
            color: .red,
            title: "Salchipapas",
            sub_title: "No se que poner aca",
            image_url: "https://imbgrup.com/wp-content/uploads/2023/01/electronica-1080x590-1.jpeg",
            destination: nil
        )
    ]
    
    func dismissSnack(parameter: Any) {
        // Implement your dismiss logic here, using the parameter
        print("Dismissed with parameter: \(parameter)")
    }
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            CustomPagingSliderView(data: $categories) { $item in
                SkeletonImageView(image_url_string: item.image_url,
                                  radius: 20) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 200, height: 200)
                }.frame(width: 200, height: 200)
            } title_content: { $item in
                VStack(spacing: 5) {
                    Text(item.title)
                        .font(.largeTitle.bold())
                    Text(item.sub_title)
                        
                }
            }.padding(.horizontal)
            
            
            ScrollView(){
                SliderCardView(
                    price: "USD 400", title: "Something expensive - PERU-AL", description: "this description is an example", reviews: "reviews 300", stars: 5, radius: 20, items: products)
                SliderCardView(price: "USD 400", title: "Something expensive - PERU-AL", description: "this description is an example", reviews: "reviews 300", stars: 5, radius: 20, items: products)
                SliderCardView(price: "USD 400", title: "Something expensive - PERU-AL", description: "this description is an example", reviews: "reviews 300", stars: 5, radius: 20, items: products)
            }
            
        })
    }
}

#Preview {
    HomeView()
}
