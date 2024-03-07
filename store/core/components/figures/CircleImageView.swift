//
//  CircleImageView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 22/02/24.
//

import SwiftUI

@ViewBuilder
func CircleImageView(imageURL: String, x: CGFloat, y: CGFloat) -> some View {
    SkeletonImageView(image_url_string: imageURL, radius: 15) {}
        .offset(x: x, y: y)
        .blur(radius: 10)
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(imageURL: "https://elements-cover-images-0.imgix.net/e69f3d92-9dc3-43cf-8dde-0a73a7eb6c0a?auto=compress%2Cformat&w=1170&fit=max&s=22c4f0619749e6fc0f5408a496c97fb4", x:100, y:-350)
    }
}
