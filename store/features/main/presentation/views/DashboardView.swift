//
//  DashboardView.swift
//  store
//
//  Created by Jorge Hospinal Flores on 11/02/24.
//

import SwiftUI

struct DashboardView: View {
    @State var present_side_menu = false
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    HStack {
                        Button {
                            present_side_menu.toggle()
                        } label: {
                            Image("Menu")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: 24, height: 24)
                        .padding(.leading, 30)
                        
                        Spacer()
                    }
                }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.white)
                    .zIndex(1)
                    .shadow(radius: 0.3)
                , alignment: .top)
            .background(Color.gray.opacity(0.8))
            
            SideMenu()
        }
        
        .frame(maxWidth: .infinity)
        
    }
    
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $present_side_menu, direction: .leading) {
            SideMenuContentsView(present_side_menu: $present_side_menu)
                .frame(width: 300)
        }
    }
    
}

#Preview {
    DashboardView()
}
