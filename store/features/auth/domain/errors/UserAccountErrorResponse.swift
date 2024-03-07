//
//  LoginError.swift
//  store
//
//  Created by Jorge Hospinal Flores on 20/02/24.
//

import Foundation

enum UserAccountError: Error {
    case serverError(
        message: String?,
        response: UserAccountErrorResponse
    )
    case unknownError
}

struct UserAccountErrorResponse: Codable {

    var email: [String]?
    var password: [String]?
    var password1: [String]?
    var password2: [String]?
    var non_field_errors: [String]?

    enum CodingKeys: String, CodingKey {
        case email, password, password1, password2, non_field_errors
    }

    init(email: [String], password: [String], password1: [String], password2: [String], non_field_errors: [String]) {
        self.email = email
        self.password = password
        self.password1 = password1
        self.password2 = password2
        self.non_field_errors = non_field_errors
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent([String].self, forKey: .email)
        password = try values.decodeIfPresent([String].self, forKey: .password)
        password1 = try values.decodeIfPresent([String].self, forKey: .password1)
        password2 = try values.decodeIfPresent([String].self, forKey: .password2)
        non_field_errors = try values.decodeIfPresent([String].self, forKey: .non_field_errors)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(password, forKey: .password)
        try container.encodeIfPresent(password1, forKey: .password1)
        try container.encodeIfPresent(password2, forKey: .password2)
        try container.encodeIfPresent(non_field_errors, forKey: .non_field_errors)
    }
}
