//
//  Errors.swift
//  store
//
//  Created by Jorge Hospinal Flores on 19/02/24.
//

import Foundation

enum CustomError: Error {
    case serverError(
        message: String
    )
    case unknownError
}

struct ErrorResponse: Codable {
    var message: String?

    enum CodingKeys: String, CodingKey {
        case message
    }
}
