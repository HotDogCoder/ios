import SwiftUI

struct SliderCardView: View {
    private(set) var id: UUID = .init()
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
    let price: String
    let title: String
    let description: String
    let reviews: String
    let stars: Int
    let radius: CGFloat
    
    init(price: String, title: String, description: String, reviews: String, stars: Int, radius: CGFloat, items: [Item]) {
        self.title = title
        self.price = price
        self.description = description
        self.reviews = reviews
        self.stars = stars
        self.radius = radius
        self.items = items
    }
    
    var body: some View {
        VStack(spacing: 10){
            Text(title)
                .font(.title3)
                .bold()
            ImagePagingSliderView(data: $items) { $item in
                SkeletonImageView(image_url_string: item.image_url,
                                  radius: 20) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: .infinity, height: 200)
                }.frame(width: .infinity, height: 200)
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


#Preview {
    ProductDetailView()
}
