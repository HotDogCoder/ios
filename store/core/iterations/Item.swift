//
//  ItemModel.swift
//  store
//
//  Created by Jorge Hospinal Flores on 16/02/24.
//
import SwiftUI

struct Item: Identifiable {
    private(set) var id: UUID = .init()
    var color: Color
    var title: String
    var sub_title: String
    var image_url: String
    let destination: (any View)?
}
