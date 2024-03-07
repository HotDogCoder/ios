//
//  GalleryView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 11/02/24.
//

import SwiftUI

struct CustomPagingSliderView<
    BodyContent: View,
    TitleContent: View,
    Item: RandomAccessCollection
>: View where Item: MutableCollection, Item.Element: Identifiable {
    var shows_indicator: ScrollIndicatorVisibility = .hidden
    var show_paging_control: Bool = true
    var title_scroll_speed: CGFloat = 1
    var paging_control_spacing: CGFloat = 20
    var spacing: CGFloat = 10
    
    @Binding var data: Item
    @ViewBuilder var body_content: (Binding<Item.Element>) -> BodyContent
    @ViewBuilder var title_content: (Binding<Item.Element>) -> TitleContent
    var body: some View {
        VStack(spacing: paging_control_spacing) {
            ScrollView(.horizontal) {
                HStack(spacing: spacing) {
                    ForEach($data) {
                        item in
                        VStack(spacing: 10) {
                            title_content(item)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .visualEffect { content, geometryProxy in
                                    content
                                        .offset(x: scrollOffset(geometryProxy))
                                }
                            body_content(item)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(shows_indicator)
            .scrollTargetBehavior(.viewAligned)
        }
    }
    
    func scrollOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minX = proxy.bounds(of: .scrollView)?.minX ?? 0
        return -minX * min(title_scroll_speed, 1.0)
    }
}
