//
//  CircleView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 22/02/24.
//

import SwiftUI

@ViewBuilder
func CircleView() -> some View {
    Circle()
        .fill(.linearGradient(colors: [.green, .gray, .red], startPoint: .top, endPoint: .bottom))
        .frame(width: 200, height: 200)
        .offset(x: true ? 200 : -90, y: -350)
        .blur(radius: 15)
}

#Preview {
    AuthenticationView()
}
