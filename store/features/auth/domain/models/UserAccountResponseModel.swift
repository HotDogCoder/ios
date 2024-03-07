import Foundation

struct UserAccountResponseModel: Codable {
    var message: String?
    var detail: String?
    var access: String?
    var refresh: String?
    var user: UserAccountModel?

    enum CodingKeys: String, CodingKey {
        case message, detail, access, refresh, user
    }

    init(message: String, detail: String, access: String, refresh: String, user: UserAccountModel) {
        self.message = message
        self.detail = detail
        self.access = access
        self.refresh = refresh
        self.user = user
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        detail = try values.decodeIfPresent(String.self, forKey: .detail)
        access = try values.decodeIfPresent(String.self, forKey: .access)
        refresh = try values.decodeIfPresent(String.self, forKey: .refresh)
        user = try values.decodeIfPresent(UserAccountModel.self, forKey: .user)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(message, forKey: .message)
        try container.encodeIfPresent(detail, forKey: .detail)
        try container.encodeIfPresent(access, forKey: .access)
        try container.encodeIfPresent(refresh, forKey: .refresh)
        try container.encodeIfPresent(user, forKey: .user)
    }
}
