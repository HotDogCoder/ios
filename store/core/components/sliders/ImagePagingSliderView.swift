//
//  ImagePagingSliderView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 11/02/24.
//

import SwiftUI

struct ImagePagingSliderView<
    Content: View,
    Item: RandomAccessCollection
>: View where Item: MutableCollection, Item.Element: Identifiable {
    var showsIndicator: ScrollIndicatorVisibility = .hidden
    var showPagingControl: Bool = true
    var titleScrollSpeed: CGFloat = 1
    var pagingControlSpacing: CGFloat = 20
    var spacing: CGFloat = 10
    
    @Binding var data: Item
    @ViewBuilder var content: (Binding<Item.Element>) -> Content
    var body: some View {
        VStack(spacing: pagingControlSpacing) {
            ScrollView(.horizontal) {
                HStack(spacing: spacing) {
                    ForEach($data) {
                        item in
                        VStack(spacing: 10) {
                            content(item)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(showsIndicator)
            .scrollTargetBehavior(.viewAligned)
        }
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(titleScrollSpeed, 1.0)
    }
}


#Preview {
    ProductDetailView()
}
