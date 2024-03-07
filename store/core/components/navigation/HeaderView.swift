//
//  HeaderView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 16/02/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("TOTAL FAN").font(.title).bold()
                    Text("comprar con total fan es seguro")
                }
                Spacer()
                Image(
                    systemName: "line.3.horizontal"
                ).imageScale(.large)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius:50).stroke())
            }
        }.padding(.init(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
}

#Preview {
    HomeView()
}
