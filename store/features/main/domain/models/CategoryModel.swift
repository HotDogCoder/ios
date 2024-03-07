//
//  SubCategoryModel.swift
//  store
//
//  Created by Jorge Hospinal Flores on 16/02/24.
//

import Foundation

struct CategoryModel: Identifiable, Hashable {
    var id: Int?
    var name: String?
    var description: String?
    var sub_categories: [SubCategoryModel]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, sub_categories
    }
    
    init(id: Int? = nil, name: String? = nil, description: String? = nil, sub_categories: [SubCategoryModel] = [])
    {
        self.id = id
        self.name = name
        self.description = description
        self.sub_categories = sub_categories
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encode(sub_categories, forKey: .sub_categories)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        sub_categories = try container.decodeIfPresent([SubCategoryModel].self, forKey: .sub_categories)
    }
}
