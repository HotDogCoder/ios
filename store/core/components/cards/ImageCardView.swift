//
//  ImageCardView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 10/02/24.
//

import SwiftUI

struct ImageCardView: View {
    private(set) var id: UUID = .init()
    let price: String
    let title: String
    let description: String
    let reviews: String
    let stars: Int
    let image_url_string: String
    let radius: CGFloat
    
    init(price: String, title: String, description: String, reviews: String, stars: Int, image_url_string: String, radius: CGFloat) {
        self.title = title
        self.price = price
        self.description = description
        self.reviews = reviews
        self.stars = stars
        self.image_url_string = image_url_string
        self.radius = radius
    }
    
    var body: some View {
        VStack(spacing: 10){
            Text(title)
                .font(.title2)
            SkeletonImageView(image_url_string: image_url_string,
                              radius: 20) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 200, height: 200)
            }
            HStack(alignment: .center, spacing: 10, content: {
                Text(price)
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack(content: {
                    HStack(content: {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                    })
                    Text(reviews)
                })
            })
            Text(description)
        }
        .padding()
        .background(Rectangle()
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(radius: 5)
        ).padding()
    }
}
