import SwiftUI

struct SkeletonImageView<Content: View>: View {
    let image_url_string: String
    let radius: CGFloat
    let placeholder: () -> Content
    let min_width: CGFloat = 200
    let max_width: CGFloat = 200
    let min_height: CGFloat = 200
    let max_height: CGFloat = 200
    
    init(image_url_string: String, radius: CGFloat, @ViewBuilder placeholder: @escaping () -> Content) {
        self.image_url_string = image_url_string
        self.radius = radius
        self.placeholder = placeholder
    }
    
    var body: some View {
        AsyncImage(url: URL(string: image_url_string)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .cornerRadius(radius)
            case .failure(_):
                placeholder()
            case .empty:
                // Show loading animation while image is loading
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: max_width, height: max_height)
            @unknown default:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: max_width, height: max_height)
            }
        }
    }
}
#Preview {
    HomeView()
}
