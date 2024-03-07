//
//  MarketView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 23/02/24.
//

import SwiftUI

struct MarketView: View {
    
    func dismissSnack(parameter: Any) {
        // Implement your dismiss logic here, using the parameter
        print("Dismissed with parameter: \(parameter)")
    }
    
    @State private var data: [Item] = [
        .init(
            color: .red,
            title: "Hamburguesa con paspas\nadnsd aksdj na ksdnak dnakjd s",
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
        ),
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
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                SnackView(dismissAction: { self.dismissSnack(parameter: 42) }, parameter: 42, shadowRadius: 0, data: $data) { $item in
                    SkeletonImageView(image_url_string: item.image_url, radius: 20) {
                        RoundedRectangle(cornerRadius: 0)
                            .fill(Color.gray.opacity(0.5))
                            
                    }.frame(height: 100)
                        .frame(maxWidth: 200)
                } title_content: { $item in
                    VStack(spacing: 5) {
                        Text(item.title)
                            .lineLimit(3)
                            .font(.caption)
                        Text(item.sub_title)
                            .font(.caption)
                    }
                }.frame(maxWidth: 200)
            }
        }
    }
}

#Preview {
    MarketView()
}
