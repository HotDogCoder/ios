//
//  SnacksView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 17/02/24.
//
import SwiftUI

struct SnackView<
    BodyContent: View,
    TitleContent: View,
    Item: RandomAccessCollection
>: View where Item: MutableCollection, Item.Element: Identifiable {
    let dismissAction: () -> Void
    let parameter: Any
    let shadowRadius: CGFloat
    
    @Binding var data: Item
    @ViewBuilder var body_content: (Binding<Item.Element>) -> BodyContent
    @ViewBuilder var title_content: (Binding<Item.Element>) -> TitleContent
    
    var body: some View {
        
        ForEach($data) {
            item in
            VStack(spacing: 10) {
                title_content(item)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                body_content(item)
            }
            .containerRelativeFrame(.horizontal)
        }
        
    }
}


//#Preview {
//    MarketView()
//}
