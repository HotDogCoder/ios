import Foundation

struct UserAccountModel: Codable {
    var id: Int?
    var name: String?
    var email: String?
    var password: String?
    var error: AnyCodable?
    var message: String?
    var non_field_errors: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, email, password, error, message, non_field_errors
    }

    init(id: Int? = nil, name: String? = nil, email: String? = nil, password: String? = nil, error: AnyCodable? = nil, message: String? = nil, non_field_errors: [String]? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.error = error
        self.message = message
        self.non_field_errors = non_field_errors
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(password, forKey: .password)
        try container.encodeIfPresent(error, forKey: .error)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(non_field_errors, forKey: .non_field_errors)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        email = try container.decodeIfPresent(String.self, forKey: .email)
        password = try container.decodeIfPresent(String.self, forKey: .password)
        error = try container.decodeIfPresent(AnyCodable.self, forKey: .error)
        message = try container.decodeIfPresent(String.self, forKey: .message)
        non_field_errors = try container.decodeIfPresent([String].self, forKey: .non_field_errors)
    }
}
