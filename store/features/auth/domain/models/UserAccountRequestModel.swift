import Foundation

struct UserAccountRequestModel: Codable {
    var id: Int
    var name: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var picture: String?
    var error: AnyCodable?
    var message: String?
    var access: String?
    var refresh: String?
    var isAuthenticated: Bool?
    var user: UserAccountModel?
    var nonFieldErrors: [String]?

    enum CodingKeys: String, CodingKey {
        case id, name, firstName, lastName, email, picture, error, message, access, refresh, isAuthenticated, user, nonFieldErrors
    }

    init(id: Int) {
        self.id = id
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        error = try values.decodeIfPresent(AnyCodable.self, forKey: .error)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        access = try values.decodeIfPresent(String.self, forKey: .access)
        refresh = try values.decodeIfPresent(String.self, forKey: .refresh)
        isAuthenticated = try values.decodeIfPresent(Bool.self, forKey: .isAuthenticated)
        user = try values.decodeIfPresent(UserAccountModel.self, forKey: .user)
        nonFieldErrors = try values.decodeIfPresent([String].self, forKey: .nonFieldErrors)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(firstName, forKey: .firstName)
        try container.encodeIfPresent(lastName, forKey: .lastName)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(picture, forKey: .picture)
        try container.encodeIfPresent(error, forKey: .error)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(access, forKey: .access)
        try container.encodeIfPresent(refresh, forKey: .refresh)
        try container.encodeIfPresent(isAuthenticated, forKey: .isAuthenticated)
        try container.encodeIfPresent(user, forKey: .user)
        try container.encodeIfPresent(nonFieldErrors, forKey: .nonFieldErrors)
    }
}
