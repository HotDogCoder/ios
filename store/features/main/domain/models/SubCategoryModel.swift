//
//  CategoryModel.swift
//  store
//
//  Created by Jorge Hospinal Flores on 16/02/24.
//

import SwiftUI

struct SubCategoryModel: Identifiable, Hashable, Codable {
    var id: Int?
    var name: String?
    var description: String?
    var category_id: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, category_id
    }
    
    init(id: Int? = nil, name: String? = nil, description: String? = nil, category_id: Int? = nil)
    {
        self.id = id
        self.name = name
        self.description = description
        self.category_id = category_id
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(category_id, forKey: .category_id)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        category_id = try container.decodeIfPresent(Int.self, forKey: .category_id)
    }
}
